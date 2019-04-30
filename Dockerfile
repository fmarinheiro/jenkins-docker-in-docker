FROM jenkins/jenkins:lts

RUN /usr/local/bin/install-plugins.sh \
job-dsl \
configuration-as-code \
workflow-cps-global-lib \
cloudbees-folder \
jira \
pipeline-model-definition \
locale \
git \
docker-commons \
cloudbees-bitbucket-branch-source \
rebuild \
git-parameter \
envinject \
ansicolor

