Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0E60A2615
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVWccDA6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F0710F2EF;
	Tue, 20 Oct 2026 12:53:49 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B9610EB53
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 01:22:10 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-33bf40b0c8bso1674327eec.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 18:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792459330; x=1793064130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BRQxfRnCJX8kMYRddoKffawFo2/rbvLQllYbV+J0qgU=;
 b=sVWccDA66ViOBv6GwO6R5MYvZSYI1LuKiR8MvT/pXoE266IGIYD6S6l10dudSF5aM8
 69XizvcbSzK4Q12bCrZQEEnPDZuJDKNY4yURzPar9Yziss6I+peVXz7g/m85abS4+CZY
 DC2yBL2YP5e1m66/yu1YgklshMRiIIAhIHVdT7jGWgIsEHqozYuhuxO+O8c56dl5b5Jv
 CEqBsIPtaHLHIC80jl9m+yc3asQFZKNTQ7mMeEjEndGiztpeSxsnvTIZr2VodQVEELHn
 +uV0s01epb9cwzfDEmMWr1g0XwFdbnxVz9sGjX5vPqg7Rq8HgKVkaZN7VouX9kZtaOjl
 rKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792459330; x=1793064130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BRQxfRnCJX8kMYRddoKffawFo2/rbvLQllYbV+J0qgU=;
 b=qGO+oXs0iJr9J4M6m1VDsLtanoxxOLSgR7EzFAmphVyxj+yYogO4qzKJ+rMknkqLh7
 MzcnYvsZiXuktPgO6VnP/ske5s2ukPjBzAcdZvK+ja5HPEikou36WVhfgYTLaS2+l8Nc
 ryx+q5qSfjMNiXpifpwYfpqY+zdHKomBlyDKRo9IDxmwqU9dH2Ac2Aeg/UeyV+CHatt1
 pOpmgL5uTv0w+1loQ2ZLJb6riwubVPTSBFY1Awspl4VML70815czVLRmmQypKTxGPMjG
 pvDKrOZudG5F8afUDzI2QYXIe9lUPw8jJ/DTJcs1mUmh/fYxjll5YR8ta8xcMTYR68nf
 SOtw==
X-Gm-Message-State: AFq9FYK7s0TgpZas2yG3E1onIIHPL3X1njlnja7mY0JyuhMgFgXfA1Q/
 Npz5E8WWFoHP0VmPngEasSiFGzd9PPoYyOwrXvy9TqM0kbHPZ+lFmcdHd+QZ/wXV
X-Gm-Gg: AYBFou1skH/lt/C8ADVFI3OXmFL8lBVeQpuuY3U2KxRTjFzRJzIXtz5ebGW4Yn0w1bw
 osVyzsDo4ou8l2wKj4v4QdwWqO3mmVc87fLhVQhYgpa8DEZx/HW6lQANagqNuIkW8wOUwnXxT9u
 s6c66IabyerO/+vfVZ1M/VP98Tb9wtL7XRJBRqzhwJqCjVT9ObNT3oKMZwUqzT4MoecHZ7CYXaU
 fYDoTNKF52564LmvzilZSz5uGoqb1QAXV2b0RXMC5kIu9VP3tj8WmjzJcI95z54R9xr6KCCRKJ0
 dQA7+c8/N1bz0Fzx8ay8b0wQlk3gcrIamhEaqFPU6Z05gdw5JlPlsaVE8sglyQ710DBmqUTFpAV
 waZUNGavx1f4D6lfg7f0/bQII/DhlyTfP48UCQRl2WxjheX/NjBSCwX6r2uLHTpTOyD2E2aEOU8
 nQd4ZQWF5u0gVxPgyk0ciFlwttbqa/t2esQOhgqtV6Tmb7MyM4RB1RjWmdlgmUn+VHzO/d8HjjB
 +pdiNAo1WCvi8pFZSozMCcsaOgMuZJTXqBfzGBRPNkSkl+iORAxMmWuNA==
X-Received: by 2002:a05:7300:f0c5:b0:34c:aa3e:316b with SMTP id
 5a478bee46e88-361a1270b90mr13302844eec.11.1792459329975; 
 Mon, 19 Oct 2026 18:22:09 -0700 (PDT)
Received: from localhost.localdomain ([190.13.90.101])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-360813b792bsm37025973eec.5.2026.10.19.18.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 18:22:09 -0700 (PDT)
From: Lucas Moreno <lucasgabmoreno@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, i915-ci-infra@lists.freedesktop.org,
 jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/bios: Fix reset sequence order on GLK VBTs with
 DEASSERT_RESET in INIT_OTP
Date: Mon, 19 Oct 2026 22:21:43 -0300
Message-ID: <20261020012144.9300-1-lucasgabmoreno@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
References: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:43 +0000
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
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Intel GFX CI did not run on this series because my address is not on
the allowlist. Could someone with access please trigger a retest from
Patchwork? Alternatively, I can ask i915-ci-infra to allowlist
lucasgabmoreno@gmail.com.

The patch only changes behavior on Gemini Lake DSI panels whose VBT has
the shape described in the commit message; other platforms are not
affected.

Thanks,
Lucas
