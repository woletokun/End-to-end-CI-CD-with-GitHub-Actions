# CI/CD Pipeline with GitHub Actions

This repository demonstrates a professional-grade **CI/CD pipeline** implementation using **GitHub Actions**. It supports multiple environments, automated quality checks, and a safe rollback strategy — all in a real-world DevOps scenario.

---

## 🚀 Features

* ✅ Lint and unit test on every pull request
* ✅ Automatic deployment to **Staging** on `staging` branch push
* ✅ Automatic deployment to **Production** on `master` push or version tag (`v*`)
* ✅ Secure environment-specific deploys using GitHub secrets
* ✅ Manual rollback workflow to staging or production

---

## 🔧 GitHub Workflows

| Workflow                | Trigger                      | Purpose                        |
| ----------------------- | ---------------------------- | ------------------------------ |
| `lint-test.yml`         | Pull request to `main`       | Run linter and unit tests      |
| `deploy-staging.yml`    | Push to `staging`            | Build and deploy to staging    |
| `deploy-production.yml` | Push to `master` or `v*` tag | Build and deploy to production |
| `rollback.yml`          | Manual (`workflow_dispatch`) | Rollback last release          |

---

## 🛠 Environment Secrets

Set the following secrets in the GitHub repository settings:

```text
STAGING_SERVER  # Host/IP of staging environment
STAGING_KEY     # SSH key for staging
PROD_SERVER     # Host/IP of production environment
PROD_KEY        # SSH key for production
```

> Secrets are used securely in deployment workflows via `${{ secrets.<NAME> }}`.

---

## ⚙️ Usage

### 📥 Clone the Repo

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

### 🔍 Create a Feature Branch

```bash
git checkout -b feature/my-feature
```

### 🧪 Open a Pull Request

When a PR is opened against `main`, GitHub Actions will:

* Run ESLint (`npm run lint`)
* Run unit tests (`npm run test`)

### 🚀 Deploy to Staging

```bash
git checkout staging
git push origin staging
```

### 🚀 Deploy to Production

Via tag:

```bash
git tag v1.0.0
git push origin v1.0.0
```

Or via direct push to master:

```bash
git checkout master
# make changes
git push origin master
```

> ⚠️ Tagging (`v*`) is preferred for production releases.

### 🔄 Manual Rollback

Go to **GitHub → Actions → Rollback Deployment → Run workflow**

* Choose `staging` or `production`

---

## 🗂 Project Structure

```bash
.github/workflows/
├── lint-test.yml
├── deploy-staging.yml
├── deploy-production.yml
└── rollback.yml

scripts/
├── deploy.sh
└── rollback.sh

package.json
package-lock.json
README.md
```

---

## ✅ Built By

**Oyewole Olatokun** — [@ToksTech](https://github.com/ToksTokun)

This is a simulated but production-aligned implementation of CI/CD principles using GitHub Actions. Perfect for team collaboration, automation, and professional DevOps standards.
