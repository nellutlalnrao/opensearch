const { Client } = require('@opensearch-project/opensearch');
const mysql = require('mysql2/promise');

const client = new Client({
  node: 'http://localhost:9200'
});

const ingestDocuments = async () => {
  try {
    // Connect to MySQL
    const connection = await mysql.createConnection({
      host: 'localhost',
      user: 'root',
      database: 'os'
    });

    // Fetch data from MySQL
    const [rows] = await connection.execute('SELECT * FROM mantras');

    // Ingest data into OpenSearch
    for (const row of rows) {
      await client.index({
        index: 'mantras',
        id: row.id.toString(),
        body: {
          name: row.name,
          text: row.text,
          hierarchy_id: row.hierarchy_id
        }
      });
    }

    console.log('Documents ingested');
  } catch (error) {
    console.error('Error ingesting documents:', error);
  }
};

ingestDocuments();
