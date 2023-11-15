from predict import PredictManager


def rewrite_function_cn(history_dialogue):
    manager = PredictManager("../pretrained_weights/rewrite_bert.tar.gz")
    result = manager.predict_result(history_dialogue)
    result = result.replace(" ","")
    return result

def rewrite_function_en(history_dialogue):
    manager = PredictManager("../pretrained_weights/canard.tar.gz")
    result = manager.predict_result(history_dialogue)
    return result

