const getJobs = '''
  query GetCountries() {
     countries {
      name
      native
      capital
      emoji
      currency
      languages {
      code
      name
    }
     }
  }
''';