variable "cwa_httpd" {
  type        = string
  default     =<<EOF
{
	"agent": {
		"metrics_collection_interval": 60,
		"run_as_user": "root"
	},
	"logs": {
		"logs_collected": {
			"files": {
				"collect_list": [
					{
						"file_path": "/var/log/httpd/access_log",
						"log_group_name": "access_log",
						"log_stream_name": "{instance_id}",
						"retention_in_days": 5
					},
					{
						"file_path": "/var/log/httpd/error_log",
						"log_group_name": "error_log",
						"log_stream_name": "{instance_id}",
						"retention_in_days": 5
					}
				]
			}
		}
	},
	"metrics": {
		"aggregation_dimensions": [
			[
				"InstanceId"
			]
		],
		"append_dimensions": {
			"AutoScalingGroupName": "aws:AutoScalingGroupName",
			"ImageId": "aws:ImageId",
			"InstanceId": "aws:InstanceId",
			"InstanceType": "aws:InstanceType"
		},
		"metrics_collected": {
			"disk": {
				"measurement": [
					"used_percent"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"mem": {
				"measurement": [
					"mem_used_percent"
				],
				"metrics_collection_interval": 60
			},
			"statsd": {
				"metrics_aggregation_interval": 60,
				"metrics_collection_interval": 10,
				"service_address": ":8125"
			}
		}
	}
}
EOF
}