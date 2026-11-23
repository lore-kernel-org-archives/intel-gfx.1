Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585A0606A31E
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=EVzo/JPM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B884D10EEF0;
	Mon, 23 Nov 2026 15:18:04 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118FA10EE10
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2026 13:32:11 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-8b4d6981c67so19153157b3.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2026 05:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795440731; x=1796045531;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jrHVV4UUE9RlUYbRvvlNd2Xj4jhLRNu8V0y6gzAkPhg=;
 b=EVzo/JPMzo/vv9oQKdVFrUyhn9y6chlJrbKzDPy9hGz6Pxi1fdqDsczR3DjyQX+ymi
 6FVgVhuVWgEP+uUwNWoZTIGunPJSsvrQXr6iud7r2JO8bUzZ81NUMVKNs5DgxdqskbH6
 3OKFBxasQ+PKWCxJEXAHqJ8itMckc9LI0507+M1LrIYfM+anW0+1uXjp6IOA0ixUm6L8
 wfBAQs9HWz+gwOmPtoI7nuMl1wWPuUf3pXaJwEAtxWbw6aDaIhYBlwiq7TOmVgsm1eg2
 cUqa8N5DhqqY1RYTDJww4EevDRPrJOMAraAiOQgeEmFi6mDQ8ofgm0hdUUv2wnY7w4kE
 k5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795440731; x=1796045531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jrHVV4UUE9RlUYbRvvlNd2Xj4jhLRNu8V0y6gzAkPhg=;
 b=MWlu2t+WWbtNB+EDnW7brXqU3Dq88Pi9OVyEpZjVNlCSb/uUe40aBI4p6tS43eoXC7
 OMjaYrJptggYdUPe/FIuHifbGK/TM1J+6ZHrx0f+oXjf/eFm7CQkvvPGN0x6pGgrLK/P
 0BMeUSNdxJJNKCnSiJ4RuEfOanutNN9PSH5owp2BUpATzr3VvkPVd0ETwwWUAtRaleCU
 DxTYOUkxMQ7uwhs5QY1bWo5X/2egrWUxqKlM6nw8yi1VzjXkwE/FNYmZaMVanFK/WaH4
 wMhHqTNIral64e7BmiYpYglDZxHjBN13IOOsO/HOgJVeJqk/r3IzFr3w9ZmdNq4w4XS7
 YgEA==
X-Forwarded-Encrypted: i=1;
 AL+hErGwvnCKusb2y4sRJFq6QvoiJOW2ReoNSyaFnr2VQPTkwixnxlca2IfCyEaT3K8RychXXRmi9iQIwX8=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+ibdN0iwX90ZTJkZFTkOcGwcX70eVnaCgtyBBBoXFPUdGY/Fv7
 nafprE7DPR9d4F7k91JHHr3bZLIvbX1v0KyJR34dpLmEyZ/Wl1xjOyCBLuGvydEXA3Q=
X-Gm-Gg: AZFdTZcEk0kPWh4k99c4nWIbK6+quQ/1pO6rRItlBBzMc/DxEfLP5l2twFpbjGc/TIc
 p7S/gCo3D75pZtJKTS8xQW6DvAF1iLD3TyfS5kzc0bQJbI6ApasIK8cFap0WSOCM0fin+GK6vCX
 uMsgS6IQdc5oAqdBhoFgxwjFEs50g6YfPB9jWExisbtSEfyfe7g+03rlsXcNtZAeVBg4oVa1qb3
 dBGSSPNMiTCGvwKGukXhJ9P8ftB0T/AhS0C11KWr4QyfMjjOv/sDfDRBXy7GJ8z5jyzdgT4JCBW
 Ykn3lFLbNXilKDmeqQ2ei1LSxH5qxpWvGjvVTpg2y2/MzbvcGvID2C7ikVLlKPOkVf0fp7WtCiQ
 mPdedTwKZhCJdc8x5Sf7nQP36+tuCQ09INbX8QgY8BEbprXpy/yutqL7QfGik8wSsVw51N4nZGP
 daiyZuaS1Tbww2iJDYtTvW8geEwEGibAYJAfPeS0YPizDlUHRstkcxfCu0TaKCIhet+Bx0Aghi8
 pHEKo7MbnL2/h92ayXhCd2n1dtAZ9ka/qgNk8Y5cInN0SCsUvyRDFVMkZG/y48RT9zqs44fg3H7
 +bYKczgiFeiStAYj/VHstb3X1r4h+I5ntsRRHUp1K0kw5v4z3Mh9IPM+hl7Oe/2JM85y3MQ/JtI
 8FM+Dfj0hi7nJjwpWRSSzxYNJaroHd7EkK/fADweIWIy8SBLMCx12GE6JhRYvBjiG7yMVCoFS6p
 MdvBwr7h+7Bo5VIf6qc/LLOsDQUH7AeHCqZEDY6ACtlKggRptCez/CZV33gjos3VAg7Q==
X-Received: by 2002:a05:690c:6d87:b0:88f:ccf7:25d9 with SMTP id
 00721157ae682-8b520504b49mr56847237b3.60.1795440730656; 
 Mon, 23 Nov 2026 05:32:10 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm800179385a.33.2026.11.23.05.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 05:32:10 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, rodrigo.vivi@intel.com,
 animesh.manna@intel.com, uma.shankar@intel.com, jani.nikula@linux.intel.com
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Date: Mon, 23 Nov 2026 08:32:08 -0500
Message-ID: <20261123133208.1416623-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <ba1ee8b0cd9bde1c1b93048a5d3a29a867dac8e1.camel@intel.com>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
 <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
 <awBhLKnEiGt69Vr7@intel.com> <20261120163416.66175-1-j@metarealtyinc.ca>
 <awCCGeCxHToY8tsI@intel.com>
 <ba1ee8b0cd9bde1c1b93048a5d3a29a867dac8e1.camel@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Hi Jouni,

On Mon, 2026-11-23 at 09:29 +0000, Hogander, Jouni wrote:
> Now when vblank interrupt is enabled it is triggering Panel Replay exit
> and entry to live frame mode. If
> PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE is set AS SDP sending
> is not continued.

Thanks, that explains it. The bit suppresses the AS SDP in live frame
mode, and live frame mode is entered when frames are updated. v2 [1]
clears the bit on every PSR flush (flip, cursor, frontbuffer) and sets
it again after 6 idle frames, so it follows the updates directly rather
than vblank, which was only a proxy. Vblank enable with no update
leaves it set, since nothing on screen changes there.

Two days on v2 here: one brief possible judder that did not recur and
may have been load, otherwise smooth.

[1] https://lore.kernel.org/all/cover.1795263689.git.j@metarealtyinc.ca/

Thanks,
Jake
