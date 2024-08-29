const { Client } = require('@opensearch-project/opensearch');

const client = new Client({
  node: 'http://localhost:9200'
});

const fullTextSearch = async (query) => {
  try {
    const response = await client.search({
      index: 'mantras',
      body: {
        query: {
          multi_match: {
            query: query,
            fields: ['name', 'text']
          }
        }
      }
    });

    console.log('Search results:', response.body.hits.hits);
  } catch (error) {
    console.error('Error performing full-text search:', error);
  }
};

// Example usage
fullTextSearch('Om');
