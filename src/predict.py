from allennlp.models.archival import load_archive
from allennlp.predictors.predictor import Predictor
# WARNING: Do not exclude these imports
from predictor import RewritePredictor
from data_reader import RewriteDatasetReader
from model import UnifiedFollowUp


class PredictManager:

    def __init__(self, archive_file):
        archive = load_archive(archive_file)
        self.predictor = Predictor.from_archive(
            archive, predictor_name="rewrite")

    def predict_result(self, dialog_flatten: str):
        # dialog_flatten is split by \t\t
        dialog_snippets = dialog_flatten.split("\t\t")
        param = {
            "context": dialog_snippets[:-1],
            "current": dialog_snippets[-1]
        }
        restate = self.predictor.predict_json(param)["predicted_tokens"]
        return restate


# if __name__ == '__main__':
#     manager = PredictManager("../pretrained_weights/model.tar.gz")
#     result = manager.predict_result("你 最 喜 欢 看 哪 个 电 影		行 尸 走 肉		你 咋 这 么 重 口 味 呢		咋 滴 我 喜 欢 		你 最 喜 欢 它 里 面 哪 个 演 员")
#     print(result)
