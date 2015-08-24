web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
web: erl +K true -pa ebin deps/*/ebin -noshell -boot start_sasl -s reloader -s bingobingo
