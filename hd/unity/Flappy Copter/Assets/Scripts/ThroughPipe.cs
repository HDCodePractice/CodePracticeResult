using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThroughPipe : MonoBehaviour
{
    [SerializeField]
    private LogicScript logic;

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.gameObject.name == "Middle")
        {
            logic.addScore();
        }

    }
}
