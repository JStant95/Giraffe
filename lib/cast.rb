require 'sparql/client'

class Cast
  @@queries = {}

  def self.show(film)
    if @@queries.has_key?(film)
      retrieve_cast(film)
    else
      make_query(film)
    end
  end

  def self.make_query(film)
    query = create_query(film)
    results = []
    sparql = SPARQL::Client.new("http://dbpedia.org/sparql")
    sparql.query(query).each { |result| results.push(result.actorName.to_s) }
    cast = { "cast" => results }
    @@queries[film] = cast
    cast
  end

  def self.retrieve_cast(film)
    @@queries[film]
  end

  def self.create_query(film)
    "
    PREFIX dbo: <http://dbpedia.org/ontology/>
    PREFIX prop: <http://dbpedia.org/property/>
    PREFIX foaf: <http://xmlns.com/foaf/0.1/>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      SELECT * WHERE {
        ?film rdfs:label '#{film.gsub("_", " ")}'@en;
        dbo:starring ?starring.
        ?starring rdfs:label ?actorName .
        filter(langMatches(lang(?actorName),'en'))
      }"
  end
end
