# Server-side Web Proof Generation for Twitter API Data

This example demonstrates how to use [vlayer Web Proof](https://book.vlayer.xyz/features/web.html) to notarize an HTTP request to:

```
https://api.twitter.com/2/users/me?user.fields=id,name,username,created_at,description,profile_image_url,public_metrics
```

It generates a **Zero-Knowledge Proof (ZK proof)** based on the API response, which can then be verified by an **on-chain EVM smart contract**.

---

## How to Run vlayer proving

### 1. Build Contracts
```sh
cd {projectPath}
forge build
```

### 2. Install JS Dependencies
```sh
cd vlayer
bun install
```

### 3. Set Twitter API Bearer Token
Enter your Twitter oauth token to the `prove.ts`:

```
const X_API_BEARER_TOKEN = "insert here your oauth2 token";
```

To get your user OAuth token, you need to create a [X/Twitter Developer App](https://developer.twitter.com/en/portal/dashboard) and complete the OAuth 2.0 flow. 

### 4. Start Local Devnet
```sh
bun run devnet:up
```

### 5. Run Proving Process
```sh
bun run prove:dev
```

