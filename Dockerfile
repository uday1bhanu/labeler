FROM uday1bhanu/labeler:0.1.0

LABEL "com.github.actions.name"="Condition-based Pull Request labeller"
LABEL "com.github.actions.description"="Automatically label pull requests based on rules"
LABEL "com.github.actions.icon"="award"
LABEL "com.github.actions.color"="blue"
LABEL "maintainer"="Galo Navarro <uday1bhanu@gmail.com>"
LABEL "repository"="https://github.com/uday1bhanu/labeler"

RUN apk add --no-cache git

WORKDIR /go/src/app
COPY . .
ENV GO111MODULE=on
ENV GOPROXY=https://proxy.golang.org
RUN go build -o action ./cmd
ENTRYPOINT ["/go/src/app/action"]
