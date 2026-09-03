Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B33C624A4
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1934510F6BC;
	Thu,  3 Sep 2026 16:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="n+66HtLq";
	dkim-atps=neutral
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB85410F5AC
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 13:14:36 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-93959320373so190900985a.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 03 Sep 2026 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788441276;
 x=1789046076; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9OzcMW4DCeAVquT/pRer644RBv1Bhzwct6ZyKM2ylb8=;
 b=n+66HtLqDocOOODhyOBR49mTjpgt9BmDMwPZrii6pOlaU3mk2Dohq/py6RARMCsrtP
 m9sb1tiFJYqgeYkBpTnCQNpufr9ftBnz9WGGvB26PHP4rn8JnrT5a30cuBK77TddacQA
 jJvLIx0k4WDZ9Y9xjpA1UotnZ3wyYKr2bTH8fIwVy/yYpERib3bH358blnE/Qj51fap+
 iryPC/GEhMEwzQjEgLV5OX7CEFYuYNZmHPjzL8c+yzx2wNFB8mpPp/AVAe2yZqtMzqHH
 MOcoFmpw/4Yd0BWFOwAPf/o870mf9eXMHYwxj74KoZyOkGJyDKTIgfXCqW2JEx6A+XeP
 JOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788441276; x=1789046076;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9OzcMW4DCeAVquT/pRer644RBv1Bhzwct6ZyKM2ylb8=;
 b=Q3JaRO6+AnQmxPDUb2OcwEg7i+PiAYHx2hLxi03j0yvbvLNREnPx1hLE3fWgjCWtfL
 QdxX0H83n9YDqzNs9cSvyk1mlw6vIxZd3TW58kuvQOfgjUk5OADE+oyQhZv/yWp74J7k
 iPrw/PXduYl9jaRvxJba7xnnABDS0T4kyYlzlttWoqYnSuCscF4S/pS4yRW6c6s9Qlwh
 +LWjr4apUqbt5vACwQM8bP0c/0JXXnaGC8pnBBEtHIYeUU/N87M41NRZFt+TeS7TnzdH
 L5ssToS7kj+qzkVZPhXKex3PQpp0tmvCGD1qWQCfclgymQKHolPCfTZQqlAXvyNfF2aZ
 OZiA==
X-Gm-Message-State: AFuF++m/vjmohxYNBo/Sfzn8+OogWxhv+FOuCJIBuCc4IL2L0gOHyQW6
 NEkcCbL9F8w1FtqAYlKcBifF9zBziknGIrke4Ve1zmwrFQZOIv8TwVEXqsFRLy0yQ+DH25dIkcw
 I7zCRBS6Mo4qPyp9VCxvQ76UnVmtE6cyjAdrq3U6U3AwhaqRXJ7IO9fDJkZqOonY3SEoyPv0hRc
 Qq8ftSOxk6yOqK1DWCdWiS68+wY+6bcLAx6oHLA2UfB0cmHjctKKzrjeM=
X-Gm-Gg: AYBFou1yFqih8OzggggPqX24GisSC3/+YQ47D0RYzHdGImCfmtFcnLcLkfEvaBk/AGz
 BFuQnodOIR58lMz8xJyhy8F4IDdfxSCjlI6EATigzhO9h9B9zCLJRfluDcZyh9qY082F5kHRtZ7
 IvCXk7jNMw96+TylvsASjWlGV9cJdU8ruGa1Y1O0HSkNu+nxeCLrvlD33pnQHOOofpcXyWB9VN1
 QGhw9gKqLjPlZEdLFFIbvpfryQs+vQyQezRElkojtt2s0HMXu1yXjjWWgj//CNY+HrloXQ5e5F1
 F6UMGbNMhm8lvidofmULtVrI4FLZAnaKbG5xyoDeEwMBXEonyYziyH2vvXeqXxMuXO9zMeZqm0N
 IxOu9nTInxZgs8ip6NWs3fuh1BKQF21OFzRwC3iig20/2OAHDwpANHdVK3ZhTfdEY5pubPBMtBE
 vXQZsACNj+DoM+pnCpS6TdTqmatk4FdT3BrXRGdSwBcUcJDbfeNaP+g6A0MZL0j/ftela520DH0
 Hmb+VqIJQiUgjbqmyS1OczBqlGTWLpe3nQMxztaH3NaInR8Bv/vDJEfXx0s4wk9sT1xVNlzlq4D
 h5JIywi8yGTXloDEEwPcoXqP/N9AGuk0M8YT9dksGC12zFAw9Rvpfj03t5I=
X-Received: by 2002:a05:620a:280d:b0:939:6dbd:de55 with SMTP id
 af79cd13be357-9396dbdde9dmr741980585a.18.1788441275541; 
 Thu, 03 Sep 2026 06:14:35 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397cebf93asm13692085a.23.2026.09.03.06.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:14:35 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Thu,  3 Sep 2026 09:14:32 -0400
Message-ID: <20260903131432.44250-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902192531.44003-1-j@metarealtyinc.ca>
References: <20260902162150.58778-1-j@metarealtyinc.ca>
 <20260902192531.44003-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 16:00:11 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 2026-09-03 Jouni Högander wrote:
> Best to report this :
> https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Will do. Filing it in the drm/xe tracker with dmesg from boot to the
reproduction (drm.debug=0xe), VBT, EDID and the run logs, and I'll post
the issue number here.

Jake
