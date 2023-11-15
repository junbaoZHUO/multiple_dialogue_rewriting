{
	"random_seed": 42,
	"numpy_seed": 42,
	"pytorch_seed": 42,
	"dataset_reader": {
		"type": "rewrite",
		"lazy": false,
		"super_mode": "before",
		"joint_encoding": true,
		"use_bert": true,
		"language": "zh",
		"extra_stop_words": ["的", "是", "我", "了", "去"]
	},
	"model": {
		"type": "rewrite",
		"word_embedder": {
			"bert": {
				"type": "bert-pretrained",
				"pretrained_model": "bert-base-chinese",
				"top_layer_only": true,
				"requires_grad": true
			},
			"allow_unmatched_keys": true,
			"embedder_to_indexer_map": {
				"bert": [
					"bert",
					"bert-offsets",
					"bert-type-ids"
				]
			}
		},
		"text_encoder": {
			"type": "lstm",
			"input_size": 768,
			"hidden_size": 200,
			"bidirectional": true,
			"num_layers": 1
		},
		"inp_drop_rate": 0.2,
		"out_drop_rate": 0.2,
		"feature_sel": 83,
		"loss_weights": [0.2, 0.2, 0.6],
		"super_mode": "before",
		"unet_down_channel": 64
	},
	"iterator": {
		"type": "basic",
		"batch_size": 10
	},
	"validation_iterator": {
		"type": "basic",
		"batch_size": 10
	},
	"trainer": {
		"num_epochs": 30,
		"cuda_device": 2,
		"patience": 20,
		"validation_metric": "+F3",
		"optimizer": {
			"type": "adam",
			"parameter_groups": [
				[
					[
						".*word_embedder.*"
					],
					{
						"lr": 1e-5
					}
				]
			],
			"lr": 1e-3
		},
		"learning_rate_scheduler": {
			"type": "reduce_on_plateau",
			"factor": 0.5,
			"mode": "max",
			"patience": 20
		},
		"num_serialized_models_to_keep": 10,
		"should_log_learning_rate": true
	}
}