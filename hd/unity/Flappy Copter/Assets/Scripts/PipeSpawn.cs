using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PipeSpawn : MonoBehaviour
{
    [SerializeField]
    private float spawnRate = 2.0f;
    [SerializeField]
    private GameObject pip;
    [SerializeField]
    private float heightOffSet = 1.8f;

    private float timer = 0f;


    // Start is called before the first frame update
    void Start()
    {
        spawnPip();
    }

    // Update is called once per frame
    void Update()
    {
        if (timer < spawnRate)
        {
            timer += Time.deltaTime;
        }
        else
        {
            spawnPip();
            timer = 0;
        }
    }

    void spawnPip()
    {
        float lowestPoint = transform.position.y - heightOffSet;
        float highestPoint = transform.position.y + heightOffSet;
        Vector3 position = new Vector3(
            transform.position.x,
            Random.Range(lowestPoint, highestPoint),
            0);

        Instantiate(pip, position, transform.rotation);
    }
}
