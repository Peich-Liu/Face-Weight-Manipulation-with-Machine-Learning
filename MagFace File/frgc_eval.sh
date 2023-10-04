CKPT=$1
FEAT_SUFFIX=$2
NL=$3

ARCH=iresnet${NL}
FEAT_PATH=./features/magface_${ARCH}/
mkdir -p ${FEAT_PATH}

python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/ef_non.list \
                    --feat_list ${FEAT_PATH}/frgcefnon_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}
		    
python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/et_non.list \
                    --feat_list ${FEAT_PATH}/frgcetnon_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}

python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/t_non.list \
                    --feat_list ${FEAT_PATH}/frgctnon_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}

python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/f_non.list \
                    --feat_list ${FEAT_PATH}/frgcfnon_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}

python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/n_non.list \
                    --feat_list ${FEAT_PATH}/frgcnnon_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}
		    
python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/ef_mate.list \
                    --feat_list ${FEAT_PATH}/frgcef_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}
		    
python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/et_mate.list \
                    --feat_list ${FEAT_PATH}/frgcet_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}

python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/t_mate.list \
                    --feat_list ${FEAT_PATH}/frgct_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}

python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/f_mate.list \
                    --feat_list ${FEAT_PATH}/frgcf_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}

python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/n_mate.list \
                    --feat_list ${FEAT_PATH}/frgcn_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}
		    
python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/ori_mate.list \
                    --feat_list ${FEAT_PATH}/frgcori_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}	
		    
python3 ../../inference/gen_feat.py --arch ${ARCH} \
                    --inf_list data/frgc/ori_non_mate.list \
                    --feat_list ${FEAT_PATH}/frgcorinon_${FEAT_SUFFIX}.list \
                    --batch_size 256 \
                    --resume ${CKPT}	    

echo evaluate etnon
python3 eval_net.py \
        --feat-list ${FEAT_PATH}/frgcetnon_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/et_non_pair.list \

echo evaluate fnon
python3 eval_nf.py \
        --feat-list ${FEAT_PATH}/frgcfnon_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/f_non_pair.list \

echo evaluate nnon
python3 eval_nn.py \
        --feat-list ${FEAT_PATH}/frgcnnon_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/n_non_pair.list \

echo evaluate tnon
python3 eval_nt.py \
        --feat-list ${FEAT_PATH}/frgctnon_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/n_non_pair.list \
		
echo evaluate efnon
python3 eval_nef.py \
        --feat-list ${FEAT_PATH}/frgcetnon_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/ef_non_pair.list \

echo evaluate f
python3 eval_f.py \
        --feat-list ${FEAT_PATH}/frgcf_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/f_pair.list \

echo evaluate n
python3 eval_n.py \
        --feat-list ${FEAT_PATH}/frgcn_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/n_pair.list \

echo evaluate t
python3 eval_t.py \
        --feat-list ${FEAT_PATH}/frgct_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/t_pair.list \
		
echo evaluate et
python3 eval_et.py \
        --feat-list ${FEAT_PATH}/frgcet_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/et_pair.list \

echo evaluate ef
python3 eval_nf.py \
        --feat-list ${FEAT_PATH}/frgcf_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/ef_pair.list \
		
echo evaluate basemate
python3 eval_et.py \
        --feat-list ${FEAT_PATH}/frgcori_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/ori_mate_pair.list \

echo evaluate basenonmate
python3 eval_nf.py \
        --feat-list ${FEAT_PATH}/frgcorinon_${FEAT_SUFFIX}.list \
                --pair-list data/frgc/ori_non_mate_pair.list \
