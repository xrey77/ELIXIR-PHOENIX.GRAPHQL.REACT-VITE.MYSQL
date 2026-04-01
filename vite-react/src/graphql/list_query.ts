import { gql } from '@apollo/client';

export const LIST_QUERY = gql`
  query GetProducts($pageNumber: Int!) {
    product(page: $pageNumber) {
      current_page      
      total_pages
      total_entries
      entries{
        id
        category
        descriptions
        qty
        unit
        costprice
        sellprice
        saleprice
        productpicture
        alertstocks
        criticalstocks
      }
    }
  }
`;


export interface ProductData {
    id: number
    category: string
    descriptions: string
    qty: number
    unit: string
    costprice: number
    sellprice: number
    saleprice: number
    productpicture: string
    alertstocks: number
    criticalstocks: number
}

export interface ProductListData {
    product: {
      current_page: number;
      total_pages: number;
      total_entries: number;
      entries: ProductData[];
    }
}

export interface ProductListVariables {
  pageNumber: number;
}


