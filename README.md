# opensearch

In db_schema, I designed a SQL schema for Database. 
1. To Make that Database Searchable, I created an Index name "matras" with mapping properties (which is like a schema in opensearch) 
and executed it using node src/CreateIndex.js.
2. Connected to SQL Database and created an Document Ingestion into Index in IngestDocuments.js and executed it 
using node src/IngestDocuments.js
3. Using FullSearch, I was able to search the Data from Index File and results are displayed on the console using 
node src/FullTextSearch.js
