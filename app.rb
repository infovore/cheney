class Cheney < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/markov' do
    depth = 2

    if params[:depth] && params[:depth].to_i > 0
      depth = params[:depth].to_i
    end
    markov = MarkyMarkov::TemporaryDictionary.new(depth)

    corpus = params[:corpus]
    sentences = params[:sentence_count].to_i

    markov.parse_string corpus
    output = markov.generate_n_sentences sentences
    markov.clear! # Clear the temporary dictionary.

    output
  end
end
