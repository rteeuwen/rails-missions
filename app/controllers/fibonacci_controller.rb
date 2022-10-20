class FibonacciController < ApplicationController

    def index
        logs = Log.all.order("created_at DESC").limit(10)
        render json: logs, only: [:val, :result, :runtime, :created_at]
    end

    def show

        result = 0
        # result2 = 0
        time = Benchmark.ms {
            result = fast_fib(params["n"])
        }

        log = Log.create(val: params["n"], result: result, runtime: time)
        # time2 = Benchmark.ms {
        #     result2 = traditional_fib(params["n"])
        # }

        render json: {
            "value": params["n"],
            "result": result.to_s,
            "runtime": time 
            # "result": [result, result2],
            # "runtime": [time, time2]
        }
    end

    # Fast Doubling Fibonacci Algorithm - Ruby Implementation
    #
    # Copyright (c) 2016 Mauricio Gomes
    #
    # Based on the Nayuki Project's Fast Fibnoacci writeup:
    # https://www.nayuki.io/page/fast-fibonacci-algorithms
    #

    def fast_fib(n)
        raise(ArgumentError, 'Input number cannot be negative.') if n < 0
        _fib(n)[0]
    end

    def _fib(n)
        if n == 0
            return [0, 1]
        else
            a, b = _fib(n / 2)
            c = a * (b * 2 - a)
            d = a * a + b * b

            if n % 2 == 0
            [c, d]
            else
            [d, c + d]
            end
        end
    end

    def traditional_fib(n)
        raise(ArgumentError, 'Input number cannot be negative.') if n < 0

        if [0, 1].include?(n)
            return n
        else
            return traditional_fib(n-1) + traditional_fib(n-2)
        end
    end
end