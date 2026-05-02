# Feature Engineering and Feature Stores: Domain Context

*This file exists to give this chat and any Claude session working inside
`feature-pipeline-skill` a precise, working understanding of Feature development.
Load it alongside `context.md` when working on anything regarding Machine Learning or Features, in particular in the feature-pipeline-skill repository.*

---

## Why this matters to the portfolio

`feature-pipeline-skill` is the repo that will convert a structured Jupyter
notebook into a production ML feature pipeline. That task requires
understanding not just the tools but the problem they solve. 

---

## Feature engineering: the precise definition

Feature engineering is the process of transforming raw data into inputs a
machine learning model can use. The raw event — a transaction, a sensor
reading, a warehouse robot's GPS ping — is almost never the right shape for
a model. Feature engineering turns it into one.

The five categories of feature engineering operations:

1. **Feature improvement** — cleaning, imputing, scaling, normalizing
2. **Feature construction** — combining or deriving new columns from existing ones (e.g., velocity from distance and time)
3. **Feature selection** — removing features that add noise, redundancy, or bias
4. **Feature extraction** — compressing high-dimensional data into lower-dimensional representations (PCA, embeddings)
5. **Feature learning** — letting a model (e.g., autoencoder) discover useful representations automatically

In production ML, the pipeline that performs these operations runs repeatedly
on new data. That pipeline is not a notebook. It is software.

---

## The core problem feature stores solve

A Jupyter notebook produces features once, at training time, from a static
dataset. A production system needs to produce the same features at inference
time, on live data, with the same logic, at low latency.

Three failure modes occur when teams do not have a feature store:

**Training-serving skew.** The feature pipeline that ran offline during
training uses slightly different logic or data sources than the pipeline
running online at inference. The model was trained on features it will never
see in production. Predictions degrade silently.

**Duplicate work.** Team A computes 30-day rolling average transaction volume
for their fraud model. Team B computes it again for their credit risk model.
Neither team knows the other exists. Both pipelines break independently.

**No point-in-time correctness.** Historical training datasets include future
data by accident. The model learns from information it could not have had at
the time of prediction. It looks good in backtests and fails in production.
This is data leakage, and it is the most dangerous failure mode.

---

## What a feature store is

A feature store is infrastructure that:

1. **Stores feature definitions** as versioned, reusable code — not one-off
   notebook cells
2. **Separates offline and online storage** — a historical store (e.g.,
   BigQuery, Parquet) for training, and a low-latency store (e.g., Redis)
   for real-time inference
3. **Enforces point-in-time correctness** when generating training datasets,
   so no future data leaks into historical feature values
4. **Serves features consistently** so the same logic runs at training time
   and at inference time

In simple terms: a feature store is a shared library for ML features, with
a registry, a history, and a serving layer.

---

## Common open-source tools for production ML feature pipelines

No single tool does everything. A production feature pipeline is assembled
from components, each responsible for one job. The right choice at each layer
depends on team size, data volume, latency requirements, and existing
infrastructure. `feature-pipeline-skill` should be tool-aware, not
tool-locked.

The pipeline shape is consistent regardless of which tools fill it:

```
raw data source
    → data validation (fail fast if data is bad)
    → feature computation (pure functions, no notebook state)
    → feature registry + offline store (for training)
    → online store materialization (for inference)
```

**Feature stores (registry + serving layer)**

- **Feast** — the most widely adopted open-source feature store. Defines
  features as Python code (entities, feature views, data sources), enforces
  point-in-time correctness for training datasets, and serves features at
  low latency via a pluggable online store (Redis, SQLite, DynamoDB). Good
  default choice for a portfolio project because it is well-documented,
  vendor-neutral, and widely recognized.
- **Hopsworks** — open-source feature store with a managed cloud option.
  Stronger support for streaming features and a built-in UI for feature
  discovery. More infrastructure to stand up than Feast.
- **Tecton** — commercial, but the open-source SDK and concepts are widely
  referenced. Sets the standard for enterprise feature platform design.

**Data validation (quality gates before feature computation)**

- **Great Expectations (GX)** — the most widely adopted open-source data
  validation library. Defines named assertions (expectations) about a
  dataset, runs them as a suite, and generates human-readable Data Docs on
  pass/fail results. Integrates cleanly into pipeline frameworks. Good
  default choice.
- **Pandera** — schema-based validation for Pandas and Polars DataFrames.
  More concise than GX for column-level type and range checks. Better fit
  when validation is code-first and docs are not a priority.
- **Pydantic** — not a data validation library in the ML sense, but widely
  used to validate pipeline configuration and feature definition schemas
  before the pipeline runs.

**Feature computation and transformation**

- **Pandas** — the default for batch feature computation on data that fits
  in memory. Every ML engineer knows it. Use it unless you have a reason not
  to.
- **Polars** — faster than Pandas for large datasets, with a cleaner API.
  Growing adoption in 2024-2025 as teams hit Pandas performance limits.
- **Apache Spark / PySpark** — the standard for distributed feature
  computation at scale. Necessary when data does not fit on a single machine.
  Overkill for a portfolio project but important to know when to reach for it.
- **dbt** — SQL-based transformation tool used upstream of feature pipelines.
  Defines feature logic in SQL with version control and lineage tracking.
  Common in data engineering teams that feed ML pipelines.

**Pipeline orchestration**

- **Prefect** — Python-native workflow orchestration. Wraps feature
  computation and validation steps into observable, retryable tasks. Easier
  to stand up than Airflow for a small project.
- **Apache Airflow** — the industry standard for DAG-based pipeline
  scheduling. More operational overhead, but more widely recognized.
- **Metaflow** — built by Netflix, designed specifically for ML workflows.
  Handles data versioning and compute scaling alongside orchestration.

The notebook is the source of truth for what the features are. The pipeline
is the mechanism that makes them reproducible, testable, and serving-ready.
`feature-pipeline-skill` does not mandate a specific stack. It teaches the
pattern. The implementer picks the tools that fit.

---

## Regarding Robotics 

Robotics ML pipelines face all of the same problems as any ML system, plus
stricter real-time requirements, sensor data at high frequency, and physical
consequences when models are wrong.

Commonalities include

- ML systems fail in production (not just in notebooks)
- Gaps between data science and data engineering
- Need to scope the right infrastructure for the right project
- Apply MLOps best practices

---

## Reference reading

- Zheng, Alice and Casari, Amanda. *Feature Engineering for Machine Learning*. O'Reilly, 2018.
- Ozdemir, Sinan. *Feature Engineering Bookcamp*. Manning, 2022.
- Kuhn, Max and Johnson, Kjell. *Feature Engineering and Selection*. Chapman & Hall/CRC, 2019. (R-focused, but the concepts are language-agnostic)
- Feast documentation: [docs.feast.dev](https://docs.feast.dev)
- Great Expectations documentation: [docs.greatexpectations.io](https://docs.greatexpectations.io)
- Pandera documentation: [pandera.readthedocs.io](https://pandera.readthedocs.io)
- Hopsworks documentation: [docs.hopsworks.ai](https://docs.hopsworks.ai)
- Prefect documentation: [docs.prefect.io](https://docs.prefect.io)
- dbt documentation: [docs.getdbt.com](https://docs.getdbt.com)
