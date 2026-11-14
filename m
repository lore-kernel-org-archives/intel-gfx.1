Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A04606A323
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gguEGFo4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5146810F0B4;
	Mon, 16 Nov 2026 14:37:32 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D169E10E805
 for <intel-gfx@lists.freedesktop.org>; Sat, 14 Nov 2026 02:51:51 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c50604721c8so336347066b.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Nov 2026 18:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794624710; x=1795229510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MhJIErRaTVfRxe+/WdgTiC6buoyYG4cHph19YbmHDSc=;
 b=gguEGFo4Bf67glihAZVbNVEZ6M/Yhig3Fk1RiIIC+BWln/cLe181im+hestGCMHkko
 s7q2RxTPMysd5n04U5E+H8wAQ1uqOT3JDUog6yzExhyiqK7DIWQLgTZ/dLHkxhFq3IiL
 j7avTIwljGYiknjcpnGg+baG4PHHahbtg984M6jWXgnilHZ9SWCHPvCi1i69RclRd/CI
 eyM0Q5QvWzB+JTRRcZzVXJhOeSY2m8zw52eDRzPb/YY58ibmfqCFTZv9KROGV0uQt5oI
 d6NbfROIsKez592nsTeC0KguPNUyIKh4nQ1Mb1qEQdMBWkpYnbBPmnNiODKYDU3/GYJd
 DNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794624710; x=1795229510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MhJIErRaTVfRxe+/WdgTiC6buoyYG4cHph19YbmHDSc=;
 b=idbF3I6gGaCD5i7nj1Ru/9ZP8UEgPs+ZwvUiNQIy7K2EwYeY5JyL5knooz8uIEWuN2
 tN44jyRhIh00M0jz2aIDAtVjCa6Xch6UwKDgUG2nD8Isxon0mMHR7kxAi1z/Nvm0mlud
 uQx2jn9lMdbaA2UqFlMtLViSlRiFaqHc9AF05kEP9rGHsp+Y6UuobnRmnAicV5vUNqjd
 ooj+iAtIQSknXzkLtIRFYjF47v3NIUZl2K0CiDGfqFrvXsGtCP5q063BsgtvOMDGFCHJ
 CMg4NP73Xaa8oKOHsHCinEuWMcr5LpcPcmIWPyLoCBkutDBCmqmeYPv2CbcQwNN9oh0/
 fbNw==
X-Forwarded-Encrypted: i=1;
 AL+hErFRCjRwGcw5G3SadjKp6Ri+yOFzhmnDVffj3GpCSD0hrcXjsLG4EMWsu3w7LuTxKMYKGv4hozfl4oY=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8HDsp1Ymi7FEgTTVw+zK0o8faCUSLXKUuuHfRagN5oqEunmuCx
 miuyMtGtrZIuWAibCFdFJKIVZtOtVa9yfyXgw7d5NsH/y+QhYDGWeGjX
X-Gm-Gg: AYBFou2ZhAleR/QUkq45MWuKbIqH/AWLBLfPu88B7cU+nAxp1MxpbxDm4j/vZS2Uh0a
 cQ9zz4eTdB4jxeOKOFAnlMe9KTv5Uw3pRCPD0A6+pgWjR1PxpDP/muT8HV4l5nrkO1AEUVoccaA
 t6YrwuAu7xgIR2Tf0vNZysVeiIe7AeJ1SLY3dZSNv+Wq2ZiPjgEmf/BOTX/iCBlo9zR0J+98/ay
 sGDUnn4tfn+w3N9svZgkMNcLeyCul2Yeku9+aKQM7FviijWnDW4/Whf8YVxLVt4Q6NrETWEj17t
 WQiU2hrhJeG4W02FpuJATDVJn+cU3I8Wu1YFawuckxny0WSoLFkjv+LnfpeCbSuvB2OtbsAf5JS
 2mBeh+ZtRuZTQmon1IQMlXHmsEQ39womQodlGYmfS/Oslndw4tn28i4tAmbZzgDdYLqO58fNtc4
 P19NxDntEWY8bq48r0cuz2k4ttN/oQe2BmfWA5VzVVI4jXEm3UTrZrCJRQNyqT6wgi64o3okWQF
 k3N62IZ9beiGz/LOG1UK9tDpC4vNozAZTwzOdAJac6Jniv5CZakjAUrRZXr8/+0HWUVHzGNL71A
 Pi5NsX2A7+1l1aX+3VVGRrivRb3SP9vtU5r8zx4d018zgKBu6tgnojejf7VYIRZmlQJ/92jsC2I
 m7In8bplRN8H/g6IRc2WctilkrfNdcNRmZFH3K4PdDTHu
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c5096370c31mr367846866b.16.1794624709830; 
 Fri, 13 Nov 2026 18:51:49 -0800 (PST)
Received: from SMOK.angora-ide.ts.net
 (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b58981sm166556766b.45.2026.11.13.18.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 18:51:49 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: ElXreno <elxreno@gmail.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com
Subject: Re: [PATCH 7/7] drm/i915/vrr: Allow VRR with the pipe joiner
Date: Sat, 14 Nov 2026 05:51:12 +0300
Message-ID: <20261114025115.2419087-1-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-214052@kernel.org>
References: <20261114014335.2132756-1-elxreno@gmail.com>
 <20261114014335.2132756-8-elxreno@gmail.com>
 <sashiko-outbox-214052@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:25 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 02:24:32AM +0000, sashiko-bot@kernel.org wrote:
> Can allowing vrr.enable on joined pipes trigger a NULL pointer dereference
> in intel_crtc_needs_joined_update() [...]

Yes. I can't reproduce it, no third pipe can be lit on the i915 side of
my machine. v2 will have

+		/* A DDB change can pull in one joined pipe on its own */
+		if (!new_pipe_crtc_state)
+			return false;

> When a joined pipe's DDB allocation changes while VRR is enabled, does
> falling back to per-pipe updates in skl_commit_modeset_enables() break VRR
> push sequencing?

It delays, it does not break: without a push the secondary latches at
the vmax vblank, one frame of up to 1/min refresh later. The cover
letter lists DDB changes among the commits that keep the per pipe
sequence.
