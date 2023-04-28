using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerJump : MonoBehaviour
{
    [SerializeField]
    private float flapStrength = 5f;
    [SerializeField]
    private AudioSource jumpSoundEffect;
    [SerializeField]
    private AudioSource gameOverSoundEffect;
    [SerializeField]
    private LogicScript logic;
    private Rigidbody2D rb;
    private bool isActivate = true;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {
        if ((Input.GetKeyDown(KeyCode.Space) || Input.GetKeyDown(KeyCode.Mouse0)) && isActivate)
        {
            rb.velocity = Vector2.up * flapStrength;
            jumpSoundEffect.Play();
        }
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        logic.gameOver();
        gameOverSoundEffect.Play();
        isActivate = false;
    }

}
