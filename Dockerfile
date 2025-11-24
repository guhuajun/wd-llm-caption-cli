FROM harbor.tools.pe.contoso.com/yanwk/comfyui-boot:cu128-megapak-pt28 AS base

FROM base AS app

WORKDIR /root/wdllmcaption/

ADD . .

RUN pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple -r requirements_gui.txt && \
    pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple -r requirements_modelscope.txt && \
    pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple -r requirements_onnx_cu12x.txt

EXPOSE 8282

CMD [ "python3", "gui.py", "--listen"]
# CMD [ "sleep", "inf"]
