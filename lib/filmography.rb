require 'sparql/client'

class Filmography
  def self.show
    query= "
    PREFIX dbo: <http://dbpedia.org/ontology/>
    PREFIX prop: <http://dbpedia.org/property/>
    PREFIX foaf: <http://xmlns.com/foaf/0.1/>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      SELECT * WHERE {
        ?f rdf:type dbo:Film .
        ?f dbo:starring dbr:Macaulay_Culkin .
      }"
    results = []
    sparql = SPARQL::Client.new("http://dbpedia.org/sparql")
    sparql.query(query).each { |result| results.push(result) }
    results
  end
end
