Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C8E606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=U/ofSVul
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D80110E7E3;
	Mon, 23 Nov 2026 15:18:04 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E73010E277
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 16:34:20 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-55d360ca878so9351161cf.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795192459; x=1795797259;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D0Jp0cSCJcyhhcCdpXe0VkRCpAsJ4OZndwM93HMMgIU=;
 b=U/ofSVulv5Q2AVt92x+jtMF68YgQFxSudJOOUwXAOdv/VlmbhMAUZPXpdf7g9giIxR
 oCHiEYvjB4HOUVljuQXdMdFea7ohnqSPfrEFJ5wKf7bCcerrKLt6H05ZMnkMVA+Zwfj6
 cUyld60n0xtHUOEOh86SUQSVvpsE92JLB8FgScy0nq5jaeC8fXObZRR96Vwx125OTifL
 a8he0uL51235AaHYdnqQ+DCgCRZ527Rpm+bgYzDNPLjswfdonS6vuGO3VkK/cacZBU0b
 AyDuF8BCu1d+hhKcPnGzYvL7aQz6GIihu6OJqweQp2baNgB+YbyN8aOqDGefnG8lWt2P
 gxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795192459; x=1795797259;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D0Jp0cSCJcyhhcCdpXe0VkRCpAsJ4OZndwM93HMMgIU=;
 b=OYB9nYZC/oz5/g5KBXPjQWBHeh7yb0wbDo5YwKIcfxcMRjtnz8PuxR27jRWOPOGn+T
 CepWFdytbT2R6gjqFoT6/ZzGONlH4bHQZ0nRK5a+lu4YOOrzYJ+VKk1x94/Z8LlLVXig
 s7JAobw8rv/3a7A83866LzqrJ5VmyVzqMnw8EsAM2ehUmKlUpKQ/Qi27r5+NIVfPKuO+
 kFt+uHH+Xuup7Lktvg+C3MWNi4asxw5dKVUtQBOxQZHdSkL+FROs3KCvhmdDFeYXhL31
 V1jO1XBJintnB8m2Z1tH8AUfgdDXzwSGMn5OW63aelsRRUU8DOMMpOkcbFTvB1gxnEEp
 27tA==
X-Forwarded-Encrypted: i=1;
 AL+hErETXjMTAMdBXETtAcqGjp89adWIVthHiwkL/cbT0EXclqrCi88v5I/GgVSov/z3RYmbx30NhGBQZqE=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8vU8utvQ/656aAiGgmPWqCTuWIDm9knbShTmCHGDsFf453DJT1
 zzmWu/rZz74+BQIVFL9Qs3qVEklvyLEcMK1S3X6MUG5w4NYusRf3tNQq/1uI6RjGKPE=
X-Gm-Gg: AYBFou0YYFrUY6Qea22d1UxEEqO02jjR8Tyu78Mv8ShDT+yAZo171bEWRQ/Utt6wC0p
 GU4ICwFZY4xeZSA4e7D9yjKZpu5EaAjrM1gDIA5f5gMta1d8Y+Ctlwi0wPOUX35U25p/WI9yblD
 pNHyr+9Ccuduk+zBqfIL1MzOEbXfZukxu+MNb+Pg8lWjJWFMkLIt0ngmI2w2+h2bho10Hu+71lH
 p3zJavH7tbEgnq5OXy7a8Jl2bZJaRZnm2fOUBw7j6QWEJrMwiPfLBM8aTINa/JfyAyGTNKln9Zw
 kjAjbPQgSqu1tnjDKSSLnz9m5c9HiSs5K/UK2ZJyV6Uj1fDUCmmufRmd6tTtV+5MeSQ5HnSWd/q
 iObOvIHbP717B9TQ129R9eWm26TbUgbDcgl9GcIJPVGEg5wgp8J2MmvbOzLDHLqV0WoDPErxWTm
 PJu7o0H+eQKq9l31H2ozypxJBKsb0fXG92Xn0H8hC/KzrTwBJC7/AEKCWBL0XowiM0ZKVBLgu00
 iyHXkLdMnmYlT96X8l9eqRZ6DYTn2U6FcX/2/xczoTWjZZr6UcEd0j+YA3NwbMEeJixMKz4Fv5h
 RpUxNaLL0nebWOc97dD8ya75xol3TqTbnSRrRa5PHdhfoHLlMDXIrB1lDIDwDgHl/IHrQGBY/Fs
 VndROKxdOIqICZLXCrCAtPBP7aF8iXDjq7rGDA6YSK8oN58pOt+u7gnRjaHAEy6XfIBYc7Pgend
 CtNBoE0sZtD71WrIOU/kcMwYsc+UIC+Vbl2HAkVTd5TQFN9ag1Tf0/2v5qXCgIbwg/eYKyYSsAI
 fMa7iqe1P4HFqDR1lNzcerf7jl0khGvC2lGfyB+5xGFJsmAPlfIszC31EoJ7Na/qTexH8fU6g7S
 zDqNbywz
X-Received: by 2002:a05:622a:1b29:b0:535:24f8:fe3c with SMTP id
 d75a77b69052e-55d7699410amr69341751cf.5.1795192459570; 
 Fri, 20 Nov 2026 08:34:19 -0800 (PST)
Received: from jake-laptop (pool-99-229-241-217.cpe.net.cable.rogers.com.
 [99.229.241.217]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm28757536d6.34.2026.11.20.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 08:34:19 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: ville.syrjala@linux.intel.com,
	jouni.hogander@intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, rodrigo.vivi@intel.com,
 animesh.manna@intel.com, uma.shankar@intel.com, jani.nikula@linux.intel.com
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Date: Fri, 20 Nov 2026 11:34:16 -0500
Message-ID: <20261120163416.66175-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <awBhLKnEiGt69Vr7@intel.com>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
 <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
 <awBhLKnEiGt69Vr7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:58 +0000
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ville,

On Fri, Nov 20, 2026 at 05:03:08PM +0200, Ville Syrjälä wrote:
> Is this some weird hardware quirk of ours? I don't see what vblank
> interrupts (purely an internal thing to the display engine) have to
> do with the external panel receiving SDPs.

The panel doesn't care about vblank interrupts. What it needs is the AS
SDP while frames are being updated. With the AS SDP suspended in PR
Active it judders, and with it sent all the time it's smooth but
DC5/DC6 is blocked.

Vblank enable is only used as the "frames are being updated" signal.
Userspace holds a vblank reference while it flips, and Panel Replay
already holds DC_OFF for that window, so sending the AS SDP then costs
no DC residency. It is suspended again before DC_OFF is dropped.

Jouni can say whether the internal confirmation explains why the panel
needs it. From my side I only know it's this sink (LG, OUI 00:22:b9)
on two Dell models.

Thanks,
Jake
