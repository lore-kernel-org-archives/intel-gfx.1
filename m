Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C7606A31A
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3V3/0Ol
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B32D1122A5;
	Thu, 29 Oct 2026 13:14:37 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF95E10E4D6
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 13:00:43 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-33bb5afa736so362978eec.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 06:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278843; cv=none;
 d=google.com; s=arc-20260327;
 b=FdvOdzL3JLjjdAeuFCYdXnXXV/wnQni3xaSjln/8oIy5HNHk24hPYp+xh4dd3yBrDz
 8UcG+5lD00ydNykqTFZrmTS9XlIUBdXTqugGAmpmnyNXn0KamB3DaClXZCGv+E1v5MIP
 0pWGcuvSXD3a6gYQF6K4lgE7bxuuwn+WC2RufOhilq9NaDd9t1DXzswxeWyC/lZxeZdX
 j05n40va2wL5UsPHPuEfWXzUYCEe9UqUelKCYKzMRedmeauBCC04ULexDJNgzB1oUbZN
 hCivOlLbxJ+Rm/S6SpL9c7oKg0vmzRg880lUKFN8rAFfYfJQ88ci8bWXk77eHd3NPXFu
 H+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
 fh=ErunUI/AjqsOtgzbQPOOCjxhNgPq+qSPkaRK8/SRKi0=;
 b=YN3Z2rYp3IP0B5BmZuLNL3HdxkxLyu6GFS3cw8S/6CJJoI+B6vy0ZdYnxKFAvT/bsT
 fON55xDKzspXtNEnfuU4bpIT7dfUYzF90Fhfw6G6D39oqV7DQUuwviRgGA88gEJ4HXIy
 +Hv6f3Sy8VJRkn5B9eXqKkJ2Dz0u4wSUrScceSjo2ahuLmteqIXk1s96LXxyH50Mu6Qs
 2eLXH2I4qVZlpaFOOjquV9zPatzE/zpCHgRJAvyIPGeHT7JKH1XF3xTriu+9QnGU57OG
 5hbDZ7rYTpfA6XEnTm0B9Or8TBDBKn2oc8o9x1/1qW5JnwEY3bTxyF2PDBs85QblCNnM
 CDNQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793278843; x=1793883643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
 b=o3V3/0OlVDU+2oCIJhRCXz7cGVAN2RGC6rGtv/x0ZMXIzxPOZEs+bHHSFfMENXRgqW
 0/5LUAQq4OgSG+UGdw71Mm7KWykmGcwfxgIg5F5XNTdK3gjo+D35bugDssH8qVPt+e4Y
 ZA9OLTXmQrwEOudmdCsVtWQlEZcdqh2XOvrs9B3JoY3QHVEGXInY0T4suHKnrs4QWkjc
 sUxkh2uPGPuNyHknfSe+utT0ANnRAowEngUmtSM7GXF6RilzImediWbwVY9pUQIh49qn
 REEM2cYiQWEcu2NGOm16hD2HrmazG971WY3nuTX+8rG2/+QLnvIrmCGpwLLhKZO4hYzl
 XnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793278843; x=1793883643;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
 b=ImsrStBC8Zowv/6sFlHixIEIlW+k/DnqgWo5YQa9xCoY8Biqy6E34zptD3SQd21z/i
 i6pxMUNgxyEVTbz53LX69KyKvI9sTjWUmrl/2izgK5X7p/o3BKz5KlsqlP5uPkJS1VlU
 mlO72ZylVk/4Ry1pukSU1N9UjayO6ery8O8SzsU0psjnwED91j+rXf5p0o7zHHu/JvrE
 3Vlq/oYfDwWvfKUyRr7sjMzs714ZkYbxHY0Dw5iIcPn7cuxm9gC5uEAxi5SdrC488yTJ
 7mwKayXGilKNN4X4LxW+Zq+WNYAZurMwqsE0z0BxC4D0uhzTnhAtjBZo7n7DQKQLwyBD
 Gtxw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwIvjGYa64eVSF+fQldjIU/K1zMIGzKPkLAtNvBv/uK/Gmtl2OxSzz+w5PQZ6+TLlbZmqU58SWuA0M=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIvFPYI12w8VCUqWuhc7oExUnRdS3pBtmBjIRw8/Ab55Tc8Mc95
 gXFtpQudTSXn4jFB5jSsVylKXA+Vo/T1b1Nc3m19c7aN4ieq8HSlbnnLK8JL3yKOaKqiPZoQCWu
 +Hekwr8aNfneRgEvHa0OpxmelP0PgH+M=
X-Gm-Gg: AYBFou1DDfuElKUQYN1zzB75wcxVtVfJUsUdR2EnOHfK0aZecZ66oaCOvvUoEVxVq2G
 xEsqi0Tvp+iRhlyKl5Usc8yaZYBV/Sd90epoElKJlC1QmzQx4+XCNc9tmviyl6/LzNWGD/s+y2G
 XN8LvoeNnAM6mr/0SLe/Dymttv3Z0NW2f0lTjPjInIdeGCR1MStCQgyQhEt3jqGFgQNfmrA9Sqw
 gm2wKSk/EToMBvtJXROW4HoPPH791ZlagEIsfOZyg2QSxN7u5AmUIJyFQf9sB5hRA86BULLboQ7
 SolAITseGYWsjM4CxnSw72rBO7dRMwhefjAuVC5cHKhtmuiNYZRiUd2aLNsvwIOjfd877tFSJ4q
 EheNO73eWkbx1djvAOwQhSNBKxQCwDzf0wMuw7Z7I0x2W4GXqffH8+oe3ZSsR/mcktwaMNVv0rb
 GCAuDEc5TfjgG+JAqGee7TgEdKQaaRrUFjJdG2DalKQqQABA9EMgy3rLhQ0LKT0pPGWfhNQu1Ak
 lklMQ5MltGdIkkJtNTO/A0Sss6WpYlY1j2iWw==
X-Received: by 2002:a05:693c:4196:20b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a202cb0e4mr12034617eec.2.1793278841146; Thu, 29 Oct 2026
 06:00:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com>
 <5bfdc1491d297b5e98cf42322c790f06481c28c7.1793027261.git.d@ilvokhin.com>
 <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
In-Reply-To: <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 14:00:28 +0100
X-Gm-Features: AclHuK_VOCF7u599iESvOsHhN0DoC1VeK-LagvEMwpUC6WNOUUTl411X-macJoc
Message-ID: <CANiq72mMm75svCqevd8fHtVoczDpvpo4NwL0SC8=bWy030vQuQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/gem: Switch to __nonnull_args() macro
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 29 Oct 2026 13:14:35 +0000
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
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 8:32=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Should gem.h now include <linux/compiler_attributes.h> ?

No, it should be included for you (unless you are doing something
custom with the compiler flags etc.).

I hope that helps!

Cheers,
Miguel
