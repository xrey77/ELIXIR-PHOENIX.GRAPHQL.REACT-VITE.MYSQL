import { gql } from '@apollo/client';


export const CHANGE_PASSWORD = gql`
  mutation UpdatePassword($input: UpdatePasswordInput!) {
    changePassword(input: $input) {
      message
    }
  }
`;

export interface UserData {
  id: number;
  firstname: string;
  lastname: string;
  email: string;
  mobile: string;
  username: string;
  isactivated: boolean;
  isblocked: boolean;
  mailtoken: string;
  userpic: string;
  qrcodeurl: string;
}

export interface PasswordData {
  changePassword: UserData;
}

export interface PasswordVariables {
  input: {
    id: number,
    password: string
  }
}
