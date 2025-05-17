# Migrating from Jenkins to GitHub Actions: Step-by-Step Guide

This guide walks you through transitioning your CI/CD pipelines from Jenkins to GitHub Actions.

---

##  Step 1: Inventory Your Jenkins Pipelines
- Review all Jenkins jobs (Freestyle, Pipeline, Multibranch).
- Identify:
  - Triggers (push, PR, schedule)
  - Build/test/deploy steps
  - Environment variables
  - Tools and plugins used
  - Secrets and credentials
  - Notification integrations

---

##  Step 2: Document Jenkins Pipeline Logic
- Break down your Jenkinsfile or job configuration into:
  - Checkout logic
  - Build steps
  - Testing
  - Artifact handling
  - Deployment steps

---

##  Step 3: Prepare GitHub Repository
- Ensure your code is hosted on GitHub.
- Create the workflow directory:
  ```
  .github/workflows/
  ```
- Add a new YAML file for your workflow, e.g.:
  ```
  .github/workflows/main.yml
  ```

---

##  Step 4: Translate Jenkinsfile to GitHub Actions

| Jenkins | GitHub Actions |
|---------|----------------|
| `pipeline` | `jobs:` |
| `stages` | `steps:` |
| `agent any` | `runs-on: ubuntu-latest` |
| `environment {}` | `env:` |
| `withCredentials` | `secrets:` |
| `post` | `if:` conditionals |

Use built-in or marketplace actions for:
- Code checkout
- Tool setup
- Testing
- Deployment

---

##  Step 5: Migrate Secrets to GitHub

- Go to:  
  `GitHub Repo → Settings → Secrets and Variables → Actions`
- Add secrets like:
  - `AWS_ACCESS_KEY_ID`
  - `DOCKER_PASSWORD`
  - `SLACK_WEBHOOK_URL`

---

##  Step 6: Replicate Build Environment

Example for Node.js:
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm install
      - run: npm test
```

---

##  Step 7: Add Deployment Jobs

Use GitHub Actions for:
- Docker builds and pushes
- AWS CLI deployments
- Kubernetes deployments with Helm/Kubectl

Example:
```yaml
- name: Deploy to AWS S3
  run: aws s3 cp ./build s3://my-bucket --recursive
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

---

##  Step 8: Test the Workflow

- Trigger the workflow with a push or manually.
- Review logs in:
  `GitHub → Actions → Workflow Runs`
- Confirm that all jobs succeed.

---

##  Step 9: Add Notifications (Optional)

Example for Slack:
```yaml
- name: Notify Slack
  uses: slackapi/slack-github-action@v1
  with:
    payload: '{"text":"Build complete!"}'
  env:
    SLACK_BOT_TOKEN: ${{ secrets.SLACK_BOT_TOKEN }}
```

---

## Step 10: Retire Jenkins Job

- Disable Jenkins job once GitHub Actions is verified.
- Archive Jenkinsfile if necessary.
- Fully switch CI/CD to GitHub Actions.

---

# Welcome to Etech Consulting Devops MasterClass
Trying to add Jenkins vs GitHub files to repo
Just added this line for verificstion purposes
Hello
