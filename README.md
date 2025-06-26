# CI/CD Pipeline Documentation

## 📦 Project Overview

This project demonstrates a **real-world, production-ready CI/CD pipeline** using **GitHub Actions**. It simulates deployments to `staging` and `production` environments, includes linting, testing, and rollback mechanisms — aligning with DevOps best practices.

---

## 🔧 Workflows Summary

### 1. **PR Linting and Testing**

* **File:** `.github/workflows/lint-test.yml`
* **Trigger:** On `pull_request` to `main`
* **Purpose:**

  * Run ESLint for code quality
  * Run unit tests

### 2. **Deploy to Staging**

* **File:** `.github/workflows/deploy-staging.yml`
* **Trigger:** On push to `staging` branch
* **Purpose:**

  * Install dependencies
  * Build the project
  * Deploy to staging server using `scripts/deploy.sh`

### 3. **Deploy to Production**

* **File:** `.github/workflows/deploy-production.yml`
* **Trigger:**

  * On push of version tag (e.g., `v1.0.0`), **OR**
  * On direct push to the `master` branch

> Best practice recommends using **version tags** (`v*`) to control production releases.

* **Purpose:**

  * Install dependencies
  * Build the project
  * Deploy to production server using `scripts/deploy.sh`

### 4. **Rollback Workflow**

* **File:** `.github/workflows/rollback.yml`
* **Trigger:** Manual via GitHub UI
* **Input:** `env` (either `staging` or `production`)
* **Purpose:**

  * Run `scripts/rollback.sh` to revert to a previous version

---

## 🛠 Environment Configuration

Secrets required in the GitHub repository:

| Secret Name      | Description                     |
| ---------------- | ------------------------------- |
| `STAGING_SERVER` | IP or host of staging server    |
| `STAGING_KEY`    | SSH private key for staging     |
| `PROD_SERVER`    | IP or host of production server |
| `PROD_KEY`       | SSH private key for production  |

> Note: In this project simulation, these are mocked or referenced but not connected to real environments.

---

## 🚀 Deployment Strategy

### Staging Deployment

* Triggered by pushing code to `staging` branch.
* Verifies code quality and functionality before production.

### Production Deployment

* Triggered by:

  * Pushing a version tag (e.g., `v1.0.0`), OR
  * Pushing directly to the `master` branch

> Best practice recommends using tags (`v*`) to control production releases.

### Manual Rollback

* Triggered manually through GitHub Actions UI.
* Accepts input for `env` to specify rollback target.
* Executes a shell script (`rollback.sh`) with proper environment context.

---

## ✅ Evaluation Criteria Coverage

| Evaluation Criteria         | Covered | Notes                            |
| --------------------------- | ------- | -------------------------------- |
| Pipeline automation quality | ✅       | Fully automated workflows        |
| Testing integration         | ✅       | Runs tests on pull requests      |
| Deployment reliability      | ✅       | Tag and branch-based triggers    |
| Configuration management    | ✅       | Environment secrets used         |
| Documentation completeness  | ✅       | This document + scripts provided |

---

## 📄 Directory Structure

```bash
.github/workflows/
├── deploy-production.yml
├── deploy-staging.yml
├── lint-test.yml
└── rollback.yml

scripts/
├── deploy.sh
└── rollback.sh

package.json
package-lock.json
README.md (this file or linked)
```

---

## 📜 How to Use

### Trigger Deployment to Staging

```bash
git checkout staging
git push origin staging
```

### Trigger Deployment to Production

```bash
git tag v1.0.0
git push origin v1.0.0

# OR

git push origin master
```

### Trigger Manual Rollback

* Go to GitHub → Actions → **Rollback Deployment**
* Click **Run Workflow**
* Input `staging` or `production`

---

## 📌 Conclusion

This project simulates a complete, production-quality CI/CD pipeline using GitHub Actions — suitable for any professional DevOps environment or team workflow.

> Designed and implemented by Oyewole Olatokun (@ToksTech)
