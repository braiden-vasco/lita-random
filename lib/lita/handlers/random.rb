##
# Lita module.
#
module Lita
  ##
  # Lita handlers module.
  #
  module Handlers
    ##
    # Generator of random numbers and strings for the Lita chat bot.
    #
    class Random < Handler
      route(/^rand(om)?$/i, :route_random, command: true)
      def route_random(response)
        response.reply(::Random.rand.to_s)
      end

      route(/^rand(om)?\s+(\d+)?$/i, :route_random_to, command: true)
      def route_random_to(response)
        to = response.matches[0][1].to_i
        response.reply(::Random.rand(to).to_s)
      end

      route(/^rand(om)?\s+(\d+\.\d+)?$/i, :route_random_float_to, command: true)
      def route_random_float_to(response)
        to = response.matches[0][1].to_f
        response.reply(::Random.rand(to).to_s)
      end

      route(/^rand(om)?\s+(\d+)\s+(\d+)?$/i,
            :route_random_from_to, command: true)
      def route_random_from_to(response)
        from = response.matches[0][1].to_i
        to = response.matches[0][2].to_i
        response.reply(::Random.rand(from...to).to_s)
      end

      route(/^rand(om)?\s+(?<from>\d+\.\d+)\s+(?<to>\d+)?$/i,
            :route_random_float_from_to, command: true)
      route(/^rand(om)?\s+(?<from>\d+(\.\d+)?)\s+(?<to>\d+\.\d+)?$/i,
            :route_random_float_from_to, command: true)
      def route_random_float_from_to(response)
        matches = response.matches[0]
        from = matches[0].to_f
        to = matches[1].to_f
        response.reply(::Random.rand(from...to).to_s)
      end
    end

    Lita.register_handler(Random)
  end
end
