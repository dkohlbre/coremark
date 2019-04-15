#!/bin/bash

source $TEST_CONFIG
TEST_LOG_FILE=${TEST_LOG_DIR}/BASE_coremark.log
KTEST_LOG_FILE=${TEST_LOG_DIR}/KEYSTONE_coremark.log

rm -f ${TEST_LOG_FILE}
rm -f ${KTEST_LOG_FILE}

for RUN_N in $(seq $REPS); do

    BASE_LOG_FILE=${TEST_LOG_DIR}/base_coremark_${RUN_N}.log
    KEYSTONE_LOG_FILE=${TEST_LOG_DIR}/keystone_coremark_${RUN_N}.log

    if [[ $RUN_BASELINE == 1 ]]; then
        cat ${BASE_LOG_FILE} | grep "Iterations/Sec" | cut -d':' -f '2' >> ${TEST_LOG_FILE}
    fi
    if [[ $RUN_KEYSTONE == 1 ]]; then
        cat ${KEYSTONE_LOG_FILE} | grep "Iterations/Sec" | cut -d':' -f '2' >> ${KTEST_LOG_FILE}
    fi
done;
