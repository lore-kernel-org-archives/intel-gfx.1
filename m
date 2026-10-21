Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4F1606A319
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2026 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eRm1bO46
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B9310E0E3;
	Wed, 21 Oct 2026 18:56:08 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4535810E0E3
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2026 18:56:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so169325066b.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2026 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1792608961; x=1793213761;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YMPynNC1sw37bsVrWwh/P6LXB5IqWl7o3sALpze6n4Q=;
 b=eRm1bO46K6XzAu+5zvGlNO7LLAEHUUaBZg/CvdIfcinHLakuxMYNHdSDFZwfsIeyed
 02TpHcDpufJtdZLo1RntIgheRfPYztNXCxJd2DopFjtjo29Z4grs8hrX5vTXEtoWdzWe
 XXP8ptTMRbrT5/XYrM93oseNJTrZV4Vc5yYc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792608961; x=1793213761;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YMPynNC1sw37bsVrWwh/P6LXB5IqWl7o3sALpze6n4Q=;
 b=xM5Qp8UZ83k+5ePuVtrIW4kQuTz8AAx27XV5Jwqo5qvs05bwtWx6jghd+T9Rn326yb
 gCIGQbN6IBCSlQX3kn2K+jLlymlPXSP4MQ/ysOKnPUADA+2KVaGiXny3JZmc9D/1ISf9
 c256GP6lCO2YSHqjdIklh5mJkL6sib02piXdLwXFTjB7h/rigqzvBnjUSDHBVJtzP2yx
 QFIuXY7vbIKbAlrWnrMBlTc+NCK+dCbEQlC0gHkkANqAvzgpi4pJ8nr93PB+rL0TaB3a
 zHti198w1ATXg4oWW62bKJOVV3MLiHXlW12RO3296V7KGPX19e7f7kRZdQFQrmdmB+bY
 3CBA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxqkQI1i47vSXj27cV3Rb8QPnyPZOqDzMleL/Fg5GfGlIClmcIwdNZtsdvCUUhDmzZjZshLkdY7DdY=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKTvKdFJ2TykBMQ+5aRdGTdbVnHivJsE1k48Z4f3UoDUc2h/YhA
 XBSegBgpLx8qkxx2km+VDnD2/HhBGrYWOXbsjNqA7AcESKrR4OCPPCaZLCUIbPLWdCmqhnDxMcx
 pmxf3YMrdnA==
X-Gm-Gg: AYBFou2nOvd6YYMWLArsQkcJrn3KqTtao+pKumPtPnCULglQimdhTCJm6FPcaBxp/1h
 8Ih5fwTf2Ly91PYc1rp1Rqk6odiwtuj/LVOL+aIZhpKhbyGo3YMbjuzAZo4smrW5pMRT6TSGV1T
 zUQFtBhWYjXHtfSwFf+tA2GgZdRCmUwSY1ezceSnDMAM7pHd0Avvfa+EuTW5j7TCWQUhg9woZuz
 RLGf8plILh7NZ1lcn9acUc/N7m2onoU9axtp16Z56UfBXydel85JCD8UhgWExYfWYONZBPJLKKm
 nflBcjYHtcturcOU7wqo15y+MoW80GB7cgEIOAfUhclrlZ3KPxAR8/TWO26BwC4kjPlyM+rPApX
 Ufw2EbQd365O1Bn6CFkjtcMhjsRSheJ2JoR7EHpPJELwZSDAOb7sXeDFWISlWhheTarrl1mvY6O
 o2jAjX78//ieQvpCMo6sueR722kQI4rI6SgpTyHRwaO54oF2/WuzkEo/67W3XATM47eIzvNcPdz
 DcEWaUjxYuGru5uQK4J2Y0OZ1NczBQWSLeGsiIKL/qoEe4a6rJ+LX3DtukVkjRlK1EwJtBcy/yd
 6Fc82HROgSN3YAIeOWszH9HX7+yQ
X-Received: by 2002:a17:907:6d27:b0:c40:dead:7466 with SMTP id
 a640c23a62f3a-c4679597fd2mr296985766b.20.1792608961337; 
 Wed, 21 Oct 2026 11:56:01 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c468a5f3244sm29656866b.77.2026.10.21.11.56.00
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 11:56:00 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so169323166b.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2026 11:56:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBw1wS2OhI1vcrtveSnceX33ucQmzbSqBsO6ppmyXBGEc6ZyAvd94wfKswV2QckniGD6pMpUwI2UQMI=@lists.freedesktop.org
X-Received: by 2002:a17:906:f5a8:b0:c40:4848:f7fa with SMTP id
 a640c23a62f3a-c4679725421mr277727666b.44.1792608960698; Wed, 21 Oct 2026
 11:56:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <376ef9d0-b03f-4f85-aee5-46cf20eb00ae@gmail.com>
 <20261020021924-mutt-send-email-mst@kernel.org>
 <CAHk-=wjxtzD1TXZr5iWu0p1+Hu0YZP7jbNSwFkp7AJYmhzhVCA@mail.gmail.com>
 <CAHk-=wipGHx_1Uztmu773yuTM2ka1fq996UmNoJpvKS0gqEdMg@mail.gmail.com>
 <atdqUYdIOqmiqqTt@gmail.com>
 <CAHk-=whrUi2M+whqwS8yfqZ=W9ts6NPOzxzGfBOwOfCC3ooeMA@mail.gmail.com>
 <CAHk-=wjFBSH9M2GYKRnd-jrMGaa-gPBoGhuscJAu4n1hGsuX7g@mail.gmail.com>
 <CAHk-=wj51-syPoqMBLnxMeLnsbCMDMXfKzKZCtOHhwWEk5DeRw@mail.gmail.com>
 <20261021025403.GAatgpS1rcSTOTs8sS@fat_crate.local>
 <CAHk-=wgDm1nHurWJLESiLeYr0_0yv_F7W8YbvrmMEfbhxM1e_g@mail.gmail.com>
 <20261021184317.GBatkHxUL2xqH9EUkY@fat_crate.local>
In-Reply-To: <20261021184317.GBatkHxUL2xqH9EUkY@fat_crate.local>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 21 Oct 2026 08:55:39 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjs-DWseqMLciovdLmhcs5xhksPGOZRCoXK_sr8tmEiKw@mail.gmail.com>
X-Gm-Features: AclHuK8f57nKb-4MoMEUR-mEL87s3HzD_7o1XJKaCavElfq4o0c-Mbe4dFzOcTs
Message-ID: <CAHk-=wjs-DWseqMLciovdLmhcs5xhksPGOZRCoXK_sr8tmEiKw@mail.gmail.com>
Subject: Re: Removing __get_user / __put_user for good
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tom Lendacky <thomas.lendacky@amd.com>, 
 Joerg Roedel <joerg.roedel@amd.com>, "Nikunj A. Dadhania" <nikunj@amd.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 at 08:43, Borislav Petkov <bp@alien8.de> wrote:
>
> Yeah, I wanted to take a detailed look on a fresh head but you pulled it
> again. :-P

Ahh, I removed it because I merged it locally, but then I decided I
should do a full build before I push it all out because I had missed a
merge error yesterday due to not doing a proper full build on my poor
little laptop.

So yeah, it's gone, but it will show up in master shortly.

And by "shortly" I mean "not as shortly as it would have happened on
my home machine".

I think I need to upgrade my laptop eventually. It's a perfectly fine
laptop, but it's from 2019. I'm sure there are more powerful ones out
there that are still lightweight.

        Linus
