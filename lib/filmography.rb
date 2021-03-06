require 'sparql/client'

class Filmography
  @@queries = {}

  def self.show(actor)
    if @@queries.has_key?(actor)
      retrieve_films(actor)
    else
      make_query(actor)
    end
  end

  def self.make_query(actor)
    query = create_query(actor)
    results = []
    sparql = SPARQL::Client.new("http://dbpedia.org/sparql")
    sparql.query(query).each { |result| results.push(result.film_title.to_s) }
    films = { "films" => results }
    @@queries[actor] = films
    films
  end

  def self.retrieve_films(actor)
    @@queries[actor]
  end

  def self.create_query(actor)
    "
    PREFIX dbo: <http://dbpedia.org/ontology/>
    PREFIX prop: <http://dbpedia.org/property/>
    PREFIX foaf: <http://xmlns.com/foaf/0.1/>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      SELECT * WHERE {
        ?f rdf:type dbo:Film .
        ?f dbo:starring dbr:#{actor} .
        ?f rdfs:label ?film_title .
        FILTER LANGMATCHES( LANG(?film_title), 'en')
      }"
  end
end
