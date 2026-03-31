import { ApolloClient, InMemoryCache } from '@apollo/client';
import UploadHttpLink from 'apollo-upload-client/UploadHttpLink.mjs';

const uploadLink = new UploadHttpLink({
  uri: 'http://127.0.0.1:4000/api/graphql',
  headers: {
    "Apollo-Require-Preflight": "true"
  }
});

export const client = new ApolloClient({
  link: uploadLink,
  cache: new InMemoryCache(),
});
