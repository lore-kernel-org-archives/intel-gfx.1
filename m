Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE3606A321
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qd+DTTH0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81BE10EA7C;
	Wed, 11 Nov 2026 15:33:44 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4612A10EA7C
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 15:33:38 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-8b0d126f631so34326527b3.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 07:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794411217; x=1795016017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Up7QviZjMRFMHwvny4CwgVuP826mPpxmQzB4d3wFNh4=;
 b=qd+DTTH0nvGa8dPeF8gGc+VxnXyW4RbBtYNrWvK0HlB0DtetzvP0bIyNZ6CcZYRbNX
 Fe+6IL00lcNeZkR8T6DCXojWssc4KxBTKXaXtSBMXWh/h3ucf6bQ5neyD+5vDuDuWfhD
 3Dix/Ae11t2s6GLL5ruaznTuHUT/4+Qom7HnYEYiu66PRuPfhu1rbuEChSA3gK1JSpk8
 /DXNAkh2qntpZg1qpI4ONyh+cyJXj5FG9vZUym4l6cLdIAHY/qTWGlu2TSpd+/fF+pyr
 ZCX9Y+zSaCo/yQZeMYTy6POi4J69wnXtDjCuVzaEv68te0fvvCJ8IrR1/89CX5fcrJpD
 kSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794411217; x=1795016017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Up7QviZjMRFMHwvny4CwgVuP826mPpxmQzB4d3wFNh4=;
 b=JxceVu+z5yBf138khLjonBIC+IkKEiJK8vaKgK4yFZnyNLp71ddc/wA7b/KlJZ0JWA
 Ir2vVLi7j/qltYAV67jbvXg2YwEdzgZyFBctcUQtycrtqj/phaW8sWuluQkcffPL1FwJ
 H2a88AUnEHGs9gZq5txuzXTs0i9UX6XpUjjRBmr2Zb/mHn28MIdnkAtafBDaD15DQZji
 fW+70+zAijodtlTtpR1/hkECoN8sT06dN5ak3ClX097wq8vqkGYDztNhsckSc8suMZ7i
 wJDcLleIfIMck/GhY9ikxCVZagAK3GI6qZOlg1PVM8/saTmnDmtS42g9XqDziaibdHUs
 1UKg==
X-Gm-Message-State: APuU4Z8h41dGCb1ZgWR3sVE8KbPsXZRpx8yDtSuMULqRQR9/7g7Re1t8
 Q5ZUqYCA0RW7jNwN/XxxI1PVLZgBEI7DArmAcXQ7vgQfdhH4moziMwWEGijI+sfp
X-Gm-Gg: AYBFou0gECFBd5P+lHZynghH664z9DIupjPhnVSV9d0ggJRUlgAH8JS+PJt5no5eyVC
 HqchDcdo27o8SWffNiZ6V5p0/zodB66t7aLJ4+5UyXPgUC07ufL1dOZJzy8algUBLgxWsIyVsA3
 J7bP8rOd3Ow295ahe6/3HlomhqAAxAr6XCSFB1uHR9BcHk3uvHXoess0PKloOOrXd4DIxi0FDTm
 k7KVYcgUQnkjVYRMIFscJCRzkOo+ObPCFRwN5U+6/CP1yy8p4t16oCpdDmkkvfrZdVYiL6ZwauG
 7bLCfWdfgc1JpzsN4vqo3wo0UlYgRi/4x71Ql8x7tsYqJihkDLdq1wjrByDmozqHbo9R5efoUBc
 zuyHQ5kLy6HsSmiIoACeDedGBkmWb0SdPiIvjX/aJOiPWwORcLTWpbcPEUDV6HAxwHXtAAdYEKN
 fiKRz3i0B+AX9evd2HvxhENIX8sTNn9ADWuZEWWIhQ7clubfaN7z9pUzFsj+zaQmflncSueGnrz
 6AyomAjR3DTP8/BaHt2s4rSzLtovPHbPXOOfdiRaJmHfLuG56ivQyp0GE16oaGJcduwcw0PqnRR
 dmA0YZ3gumN4V5nRo2UynjcAlFmJ3Irxm71Y5u9mctoGuVDWB4vlLQy+6F/B
X-Received: by 2002:a05:690c:d84:b0:8b3:90db:ac20 with SMTP id
 00721157ae682-8b3a80d06ffmr24860617b3.43.1794411217129; 
 Wed, 11 Nov 2026 07:33:37 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b39324bf79sm46803127b3.2.2026.11.11.07.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:33:36 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: javiermv@duck.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH v2 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
Date: Wed, 11 Nov 2026 15:33:04 +0000
Message-ID: <20261111153304.22079-1-javiermv@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <sashiko-outbox-209177@kernel.org>
References: <sashiko-outbox-209177@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On the out-of-order completion in the else branch: that branch keeps the
existing behaviour (only rq is completed, as before this patch). The patch
adds the off-HW case and moves the existing call under the lock.

Leaving rq incomplete there looks right while the context is still enabled
or has a disable in flight. Every path that makes a context non-schedulable
calls guc_context_revoke() right after setting the flag. The schedule
disable that revoke sends, or the one already pending, then completes with
SCHED_STATE_BANNED set, and its done handler cancels the whole list in order.

I'm less sure about the pending enable case. As the review says, the enable
done handler cancels nothing, and revoke has already run by then. So unless
the context runs again, rq would never complete, where today it at least
gets completed. My instrumented runs only logged the off-HW path, so I have
no data on how often either state happens.

If you'd like this handled in this series, I can send a v3 that leaves rq
to the cancel when a disable is pending or the context is enabled, and
keeps the current behaviour for a pending enable.

Javier MV
