const { Client } = require('@opensearch-project/opensearch');

const client = new Client({
  node: 'http://localhost:9200'
});

const createIndex = async () => {
  try {
    // Create the index with mapping
    const response = await client.indices.create({
      index: 'mantras',
      body: {
        mappings: {
          properties: {
            name: { type: 'text' },
            text: { type: 'text' },
            hierarchy_id: { type: 'integer' }
          }
        }
      }
    });
    console.log('Index created:', response);
  } catch (error) {
    console.error('Error creating index:', error);
  }
};

createIndex();
