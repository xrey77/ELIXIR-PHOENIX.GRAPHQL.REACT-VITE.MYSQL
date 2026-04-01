import { gql } from '@apollo/client';

export const SEARCH_QUERY = gql`
  query SearchForProducts($pageNumber: Int!, $keyword: String!) {   
    productSearch(page: $pageNumber, keyword: $keyword) {       
      totalPages
      totalEntries
      currentPage
      entries {
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

export interface ProductSearchData {
    productSearch: {
      totalPages: number;
      totalEntries: number;
      currentPage: number;
      entries: ProductData[];
    }
}

export interface ProductSearchVariables {
    pageNumber: number;
    keyword: string;
}


