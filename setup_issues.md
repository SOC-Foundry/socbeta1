# Setup Document: Problems and Solutions

This document outlines the problems encountered while setting up the `websitealpha` project and connecting it to Firebase Hosting with GitHub Actions.

## Git Issues

The initial setup instructions for git were mostly correct, but we ran into several issues when trying to push the initial commit. This was because the remote repository on GitHub was not empty (it likely contained a `LICENSE` or `.gitignore` file).

### 1. Initial `git push` failed

*   **Problem:** The `git push -u origin main` command failed with the error `[rejected] main -> main (fetch first)`.
*   **Reason:** The remote repository contained commits that were not present in the local repository.
*   **Solution:** We needed to pull the changes from the remote repository before pushing.

### 2. `git pull` failed multiple times

*   **Problem:** The `git pull` command failed with several different errors.
    *   `There is no tracking information for the current branch.`
    *   `Need to specify how to reconcile divergent branches.`
    *   `refusing to merge unrelated histories.`
*   **Reason:**
    *   The local `main` branch was not configured to track the remote `main` branch.
    *   Git needed to be told how to handle the divergent histories (merge or rebase).
    *   The local and remote repositories were technically unrelated because they didn't share a common commit history.
*   **Solution:** We had to perform a series of commands to resolve this:
    1.  `git branch --set-upstream-to=origin/main main` to set up branch tracking.
    2.  `git config pull.rebase false` to set the default pull strategy to merge.
    3.  `git pull origin main --allow-unrelated-histories` to merge the two unrelated branches.

## Firebase CLI Issues

After the initial git setup, we encountered several issues while using the Firebase CLI to set up hosting and GitHub Actions.

### 1. GitHub Authorization

*   **Problem:** The Firebase CLI was not authorized to access the `SOC-Foundry` organization on GitHub.
*   **Reason:** The "Firebase CLI" GitHub OAuth App needed to be granted access to the organization.
*   **Solution:** An owner of the `SOC-Foundry` organization had to go to the organization's settings and approve the "Firebase CLI" application.

### 2. Network Error

*   **Problem:** The `firebase init` command repeatedly failed with the error `Error: Failed to make request to https://www.gstatic.com/firebasejs/releases.json`.
*   **Reason:** The user's terminal environment was not able to connect to the URL, even though a web browser could. This pointed to a proxy or Node.js configuration issue.
*   **Solution:** The user investigated their local `npm` and proxy configuration. Although the exact change that fixed it is unknown, the problem was resolved after checking `npm` proxy settings.

### 3. IAM "Unknown service account" Error

*   **Problem:** The `firebase init` command failed with the error `HTTP Error: 404, Unknown service account`.
*   **Reason:** The user's Google account did not have the necessary IAM permissions to create or manage service accounts in the Google Cloud project.
*   **Solution:** The user was granted the "Owner" role for the Google Cloud project.

### 4. IAM "Key creation not allowed" Error

*   **Problem:** The `firebase init` command failed with the error `HTTP Error: 400, Key creation is not allowed on this service account.`
*   **Reason:** The Google Cloud project had a security policy in place (`iam.disableServiceAccountKeyCreation`) that prevented the creation of new keys for service accounts.
*   **Solution:** The issue resolved itself. It's possible the policy was disabled and there was a delay in the change propagating, or that one of the previous fixes also resolved this issue. The final attempt was successful without any specific changes to this policy.
