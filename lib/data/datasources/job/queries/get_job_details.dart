const String getJobDetails = r'''
  query ($jobSlug: String!, $companySlug: String!){
    job (input: {jobSlug: $jobSlug, companySlug: $companySlug}){
      id,
      title, 
      slug,
      description, 
      company {id, slug, name, logoUrl, websiteUrl, twitter}, 
      applyUrl, isPublished, 
      isFeatured, 
      userEmail, 
      postedAt
    }
  }
''';
