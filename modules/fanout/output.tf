# output "queues_created" {
#     value =  module.aws_create_queue_list
# }

# output "queues_arn" {
#     value = [ for queue in module.aws_create_queue_list.queues_created : queue.arn ]
# }