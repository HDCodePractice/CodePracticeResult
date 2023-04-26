using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PipeMovement : MonoBehaviour
{
    [SerializeField]
    private float speed = 5f;
    // Update is called once per frame
    void Update()
    {
        transform.position = transform.position
            + Vector3.left * speed * Time.deltaTime;
    }
}
