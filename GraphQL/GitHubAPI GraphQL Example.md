GitHubAPI GraphQL Example
=========================

```GraphQL
query($username: String!) {
  repositoryOwner(login: $username) {
    repositories(first: 10) {
      nodes {
        id
        nameWithOwner
        primaryLanguage {
          name
        }
        releases(last: 1) {
          nodes {
            name
          }
        }
      }
    }
  }
}

query {
  viewer {
    name
    starredRepositories(last: 10) {
      nodes {
        nameWithOwner
        primaryLanguage {
          name
        }
        releases(last: 1) {
          nodes {
            name
          }
        }  
      }
    }
  }
}

mutation AddStar($repositoryId: ID!) {
  addStar(input: { starrableId: $repositoryId }) {
    starrable {
      id
      viewerHasStarred
    }
  }
}
  
mutation RemoveStar($repositoryId: ID!) {
  removeStar(input: { starrableId: $repositoryId }) {
    starrable {
      id
      viewerHasStarred
    }
  }
}
```

