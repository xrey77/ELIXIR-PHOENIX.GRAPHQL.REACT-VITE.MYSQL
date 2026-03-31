import { gql } from '@apollo/client';
  
export const VERIFY_OTP = gql`
  mutation VerifyTotp($input: VerifytotpInput!) {
    verifyOtp(input: $input) {
      username
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

export interface OtpVerificationData {
  verifyOtp: UserData;
}

export interface OtpVerificationVariables {
  input: {
    id: number,
    otp: string
  }
}
