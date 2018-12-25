# Slack Star Catcher

## Overview

This utility exports starred Slack bookmarks to local storage.

## Usage

1) Obtain a Slack API token for an existing account. This small iteration utilizes the legacy token format. The generator is found [here](https://api.slack.com/custom-integrations/legacy-tokens).
2) Create a local environment variable with your token (Windows users might require a different method):
    ```
    export SLACK_AUTH_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ```
3) Run `ruby star_catcher.rb` from the *lib* directory of the project.
4) Please report any issues.

