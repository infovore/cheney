class Cheney < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/markov' do
    markov = MarkyMarkov::TemporaryDictionary.new
    corpus = params[:corpus]
    sentences = params[:sentence_count].to_i

    markov.parse_string corpus
    output = markov.generate_n_sentences sentences
    markov.clear! # Clear the temporary dictionary.

    output
  end
end
