Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3780606A32C
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ig1CUUlp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86C910E9CF;
	Tue, 20 Oct 2026 07:25:30 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E49F10E9CF
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 07:25:24 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6b2237b596cso4019290a12.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1792481123; x=1793085923;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1ICODlrliKO72oBKprpY8FPw4rnE8nvSDKvjlXw6yOI=;
 b=ig1CUUlpQmPTb7Eq3PiErN4Gz10/T2p09SeTcrxD2ehV3y8e3nkL7lP3Ti8W1e/apA
 uKjLimmpN9DnslNGDL2erkyp/kzEZDixOpB0sAAW18ZDmJ14Li4JJpR/uTT/kEVc8hCQ
 2UZ3Ns7HOZNJbtvhhdJBmQJVHJLrrvv306Rz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792481123; x=1793085923;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1ICODlrliKO72oBKprpY8FPw4rnE8nvSDKvjlXw6yOI=;
 b=p4elX9VuUBmy7+paVGRtP2ZDyl9qNws85jrVgZZCArT0alne3oj97sAejTK+Z453P9
 j5gP1lKnICt+S18C572vtKgtzhr9J7y/HpvO8BqEljxfA3mqlF8fZLnFYk2QS3sA+ejg
 eGU0uDBLhikNTVb51ErCi+GFBhKrU1hEAJZhL+5CKWG4vTYY/TzJtc+dlOkcIuJ+/0VA
 zYsE0WMeHE2Aci200HPBfxorNt4XKawszpGP/wRAe5rTp81ZzEanwibQYuZqVPvphqhP
 BxqSEM/k6tFxq/YXDCrYWWYX5nxKC5tRh1yp10HfgFnuB8c3Y+Be6hhDBRr3n/yKYsqy
 5gYA==
X-Gm-Message-State: AFq9FYLRV2n24hP53XnxMDmM9TarIiXt36q7JRAkQHlaoPKsg5tSqo3H
 YzsxGB61iEEfgpnnCriJJDwCdkrYOSVeGmJqp9THTs9ZuwfTLnHU8mkJeXgR1rSBsYr1XP1bJDg
 QhLU0KxM=
X-Gm-Gg: AYBFou2HtsoflRBa1dkHHeVxgShJffPeviuwq2lxksvtRrPBdA7H9FjA2RzGZwqQ3wU
 +djl1g9Ys3zkth0ZO4CEcMRkrresRySxBvzPPw/UGrKldo5kSwV2Qkbil7HyNoSav2ZyKz5hsdS
 lOqmCwxVoiyGdqYHx+eRg3S+ztml50HLM/Cd3Bpq5UjU4O7MNNI38wBk/z18h8QvMiVPaJB1Ri6
 lNzwbps2TlrGl/K1hGYuaSODcEvMTYMs5aogEe+svjk7GuUiGusN5dNTEZMlqOzoPQQP/QIJQ0S
 GQXzw5TOlMY4zicQQlq2ahTH3R4gPjCdtNPtQU2SRjhq8OCsbC5uFuKA5H1aDkeCJ07wVnIMQll
 XA3CuHhwC1ejYMq0Yt/GF/d7ZId89dgyaNpgLz3MJ/yafkjvED9CIOd/dkg7fgMBDCvp2ZYPC4b
 aG69SPHgLc/7IOaxKLL/ZM6ioJILdEfTdcIrGK6smsHxKyU1Ra9tcfdcZHjiIcHqDTKVHYCE/C5
 pGi0ILz9ragtu0Q10TpHm3bROaeo/a9A7wUPSjiCh2s6E+2xYO3WHQBuV6lnxnN2wzI+dTTwlkG
 aJcHe4XkGHb+3pzD2rtrdGcfCKXe
X-Received: by 2002:a05:6402:3216:b0:6ac:9a44:d412 with SMTP id
 4fb4d7f45d1cf-6b3a81a52e1mr6175605a12.7.1792481121588; 
 Tue, 20 Oct 2026 00:25:21 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1c7ff2sm4888426a12.19.2026.10.20.00.25.19
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 00:25:20 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c3f04e0e65fso398350566b.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 00:25:19 -0700 (PDT)
X-Received: by 2002:a17:907:7b85:b0:c21:1b58:fa96 with SMTP id
 a640c23a62f3a-c419a93bd77mr690281066b.3.1792481118954; Tue, 20 Oct 2026
 00:25:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com>
 <20261018152358-mutt-send-email-mst@kernel.org>
 <CAHk-=wiUn9EbV4TJ4J7OPY0fVc3UC+xb-pp=+rg3hRc4jQqihg@mail.gmail.com>
 <20261018174250-mutt-send-email-mst@kernel.org>
 <376ef9d0-b03f-4f85-aee5-46cf20eb00ae@gmail.com>
 <20261020021924-mutt-send-email-mst@kernel.org>
 <CAHk-=wjxtzD1TXZr5iWu0p1+Hu0YZP7jbNSwFkp7AJYmhzhVCA@mail.gmail.com>
In-Reply-To: <CAHk-=wjxtzD1TXZr5iWu0p1+Hu0YZP7jbNSwFkp7AJYmhzhVCA@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 19 Oct 2026 21:25:02 -1000
X-Gmail-Original-Message-ID: <CAHk-=wipGHx_1Uztmu773yuTM2ka1fq996UmNoJpvKS0gqEdMg@mail.gmail.com>
X-Gm-Features: AclHuK-DiS_yQskPQtrIxFePRnCPfAaQiG7PgS-hs7L4pApU1PxreYBmB2NoFO4
Message-ID: <CAHk-=wipGHx_1Uztmu773yuTM2ka1fq996UmNoJpvKS0gqEdMg@mail.gmail.com>
Subject: Removing __get_user / __put_user for good
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Borislav Petkov <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Joerg Roedel <joerg.roedel@amd.com>, "Nikunj A. Dadhania" <nikunj@amd.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bah. I made this branch of mine public because I wanted Michael
Tsirkin to check the vhost part.

But honestly, the i915 side and the coco/SEV patches are the much more
interesting ones.

So this brings in some new victims^Hpeople for that git branch to comment on.

It's all in

  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
uaccess-cleanup

I haven't dared actually boot it yet.

                    Linus

On Mon, 19 Oct 2026 at 20:51, Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> I have a whole branch that removes __get_user() and __put_user() entirely.
>
> Somebody should check that I did it right. But I didn't want to do the
> pagefault_disable() around the vringh_notify() part, so it's not quite
> the same as yours.
>
> Let me just push it out. I was going to let it simmer, but your email
> made me go "I should just let more people look at it".
>
> Mind taking a look at the 'uaccess-cleanups' branch?
>
> It builds for me. That's all the testing it has gotten so far. Blush.
>
>                    Linus
