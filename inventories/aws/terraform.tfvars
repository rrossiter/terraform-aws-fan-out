
params = [
  {
    name       = "queue"
    create_dlq = false
    fifo_queue = true
    # high_throughput = true

    service       = "sqs"
    filter_name   = "sistema"
    filter_policy = "queue"
  },
  {
    name       = "queue1"
    fifo_queue = true
    create_dlq = false

    service       = "sqs"
    filter_name   = "sistema"
    filter_policy = "queue1"
  },
  {
    name       = "queue2"
    fifo_queue = true
    create_dlq = false

    service       = "sqs"
    filter_name   = "sistema"
    filter_policy = "queue2"
  }
]

sns_topic_name              = "topic-fanout"
fifo_topic                  = true
content_based_deduplication = true


custom_tags = {
  created = "terraform"
}

default_tags = {
  owner = "rrossiter"
}