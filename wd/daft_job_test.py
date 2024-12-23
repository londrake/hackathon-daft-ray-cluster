
# wd/job.py

# ray job submit \
#    --working-dir wd \
#    --address "http://localhost:8265" \
#    --runtime-env-json '{"pip": ["getdaft"]}' \
#    -- python daft_job_test.py

import daft

def main():
    # call without any arguments to connect to Ray from the head node
    daft.context.set_runner_ray()
    df = daft.from_pydict({
    "a": [3, 2, 5, 6, 1, 4],
    "b": [True, False, False, True, True, False]
})
    df = df.where(df["b"]).sort(df["a"])
    # Daft executes the query remotely and returns a preview to the client
    df.collect()
    df.show()



if __name__ == "__main__":
    main()
