import React from 'react'
import Link from 'gatsby-link'

const IndexPage = ({data}) => (
  <div>
    <h1>Dashboard</h1>
    <p>Welcome to {data.site.siteMetadata.title} Dashboard</p>
  </div>
)

export default IndexPage

export const query = graphql`
  query AboutQuery {
    site {
      siteMetadata {
        title
      }
    }
  }
`