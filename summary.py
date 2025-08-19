import pandas as pd

df = pd.read_csv("data/claims_header.csv", parse_dates=["DateOfService"])

# KPI summary
kpi = {
    "total_claims": int(len(df)),
    "billed_total": float(df["Billed"].sum()),
    "allowed_total": float(df["Allowed"].sum()),
    "paid_total": float(df["Paid"].sum()),
    "denial_rate": float((df["DeniedFlag"]==1).mean())
}
print("KPI:", kpi)

# Denial dollars by code
denials = (df[df["DeniedFlag"]==1]
           .assign(denied_dollars=lambda x: x["Allowed"] - x["Paid"])
           .groupby("DenialCode", dropna=False)["denied_dollars"]
           .sum()
           .sort_values(ascending=False))
print("\nDenied dollars by code:\n", denials)

# ClaimType summary
ct = (df.groupby("ClaimType")
        .agg(claims=("ClaimID","count"),
             allowed_total=("Allowed","sum"),
             denial_rate=("DeniedFlag","mean"))
        .sort_values("allowed_total", ascending=False))
print("\nBy ClaimType:\n", ct)
