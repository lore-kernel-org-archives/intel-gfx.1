Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8CACA5FF0
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 23:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A355B10EF1B;
	Mon,  5 Oct 2026 23:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iW84bgW7";
	dkim-atps=neutral
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com
 [74.125.229.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CC010E038
 for <intel-gfx@lists.freedesktop.org>; Sun,  4 Oct 2026 10:51:28 +0000 (UTC)
Received: by mail-dy2-f42.google.com with SMTP id
 5a478bee46e88-35129e4607cso148320eec.1
 for <intel-gfx@lists.freedesktop.org>; Sun, 04 Oct 2026 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791111087; x=1791715887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OU10JUkOnCjExkP9pLJslSiL15VSpV7uAw3VaBnuTMo=;
 b=iW84bgW7m50V9hL74Whk78NQI9WucQGhZjEHSng4xL0WyAOdbzrOhSIqClVQJf9foG
 UOrI0zANJ3/OAps8OBc+olXys3tyyAb3rmGqjEk3S+X5dpoH6fc661QLz6u4UkxWwByU
 yvZ1jBudAC4x3FmkIQO8z8LFpGdTnRSKP4lJuzc56a/n5RZ+Ta/wy++cIdezTGUFVuRA
 UXNVKSCh4y918haOI3OauvsRxcv82tU5GMmSe5eG138Q1p+jUJhuFaO9rdMJe0+4O/4K
 DY9kgSqz8DlxSnu0aGga1S3jzp1keD1fJNy5tg4D4Vqpc3/mufv5ZGyt4gaJnBjtbdxy
 K5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791111087; x=1791715887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OU10JUkOnCjExkP9pLJslSiL15VSpV7uAw3VaBnuTMo=;
 b=Mfmshw/WcjPlKQ1qNxQ2PBAoK/i/tLTY6C8cf7s7ME1uvHV0mz94YKY0Ef76IeweBO
 grn/Lu6aTd0c43XZhaWeSwySnVjHKYFoP/D2mWF0n9FkPYnTbzkniDAcHhfPmfdjtVGF
 uVQ2ICu7cPjnxddIj1WJCd0SfOg29SrpTci8gyAzNPgNpvnVRTms+jXI6G34wN1/TKji
 mKB7gZ2Xg2DcoQ3g931BOC/v3K+xUZI6mNHvLovbglBfaHpaLb0vvyNSVSF5SJ3ZUhpx
 JtOzkeV4u7xSk95dN2YRkEC9RbbY3aYQxY1k23f2QA68ayREBUennYcrfK1UAM+wEmN8
 Lp+g==
X-Forwarded-Encrypted: i=1;
 AKwUvBztcwxSVtfG2+RKO9TGg0SMkH3DUzZ2uT6271pWn4/XR79gK4anfsXYI0AhiFQwz93OqLdFJC82658=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLHCQDvC6qF/wLr+QV2R/mb9Q4mKycGeU4aXL8ubD4Vwx7qa4gn
 4/e/Q1IoiCN540xXl57hfIok6mo9UWGsHxbo8hwVnOXNsvS7N3iCAOIY
X-Gm-Gg: AYBFou1jdgWMH60kXdj6WiZj6bzKM8EgzritMyaNRVq6fooe1MzlRX89i/66Q19tr7w
 8aLb1MZ9O/Yu5+i3wKr0ekRsiXAH2pLMfZ85QZjOrau6NJatHLAu1dDqrz62uBhybryj/pHQkWy
 Yp0gdX84Ad0R4toRWnQ46+wZWHyRxIPNcGfAvJBKLUhnoJ4xaxVYKXdjQiqazTd0OaUNKSKl7ML
 vYMctPPPEm6c0MYZfiVlsp4BUhzRkPmHSXFyk4FrZrRbo5aHSGlXKE69YZQPG6a/HcgitnjVuLz
 QmDHOjJhx1bwfOLw9pIRJqj29vtjXLz3NoED1I7qkblQdNo1kdv+yvPrwrKzSyNVEONk0mCSrpP
 woyXiGpqr+clDD31A8N9RYvc4c2tUNP+e2r7UdJPfRHymkvACaqJ11jbJByudONGz9l654y4Zj2
 +NMpzZ++PuA9ruJX5eDMDv6aNLx3bd01FI7yYtAA9p1eWbvHZyVM5/DY0FbaZXd0b7akm4vNgtV
 IvYmViOd/OHxqjUcnubNqFQAoLBcYW+fAj6c5S+PF0t4+k=
X-Received: by 2002:a05:7300:e5c2:b0:341:3ca2:de2d with SMTP id
 5a478bee46e88-34f15077edfmr9383419eec.6.1791111087081; 
 Sun, 04 Oct 2026 03:51:27 -0700 (PDT)
Received: from Anshuman ([123.63.59.156]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-35127161474sm3815965eec.13.2026.10.04.03.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 03:51:26 -0700 (PDT)
From: Anshuman <anshumantewari123@gmail.com>
To: kees@kernel.org
Cc: Frank.Li@kernel.org, James.Bottomley@HansenPartnership.com,
 airlied@gmail.com, akpm@linux-foundation.org,
 andriy.shevchenko@linux.intel.com, anton.ivanov@cambridgegreys.com,
 apparmor@lists.ubuntu.com, atomlin@atomlin.com, benjamin.berg@intel.com,
 bhelgaas@google.com, bp@alien8.de, bvanassche@acm.org, corey@minyard.net,
 da.gomez@kernel.org, daniel.lezcano@kernel.org,
 dave.hansen@linux.intel.com, david.e.box@linux.intel.com,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dvyukov@google.com, elver@google.com, eperezma@redhat.com,
 georgia.garcia@canonical.com, glider@google.com, gor@linux.ibm.com,
 gregkh@linuxfoundation.org, hansg@kernel.org, hare@suse.de,
 hca@linux.ibm.com, hpa@zytor.com, ilpo.jarvinen@linux.intel.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 jasowang@redhat.com, jbaron@akamai.com, jgg@ziepe.ca, jim.cromie@gmail.com,
 jirislaby@kernel.org, jmorris@namei.org, johannes@sipsolutions.net,
 john.johansen@canonical.com, joonas.lahtinen@linux.intel.com,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, lenb@kernel.org, leon@kernel.org,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-um@lists.infradead.org, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lukasz.luba@arm.com, macro@orcam.me.uk,
 martin.petersen@oracle.com, mcgrof@kernel.org, mchehab@kernel.org,
 mingo@redhat.com, mst@redhat.com, netdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, paul@paul-moore.com,
 pbonzini@redhat.com, pengpeng@iscas.ac.cn, peterz@infradead.org,
 petr.pavlu@suse.com, qemu-devel@nongnu.org, rafael@kernel.org,
 richard@nod.at, rodrigo.vivi@intel.com, rui.zhang@intel.com,
 samitolvanen@google.com, seanjc@google.com, serge@hallyn.com,
 simona@ffwll.ch, somlo@cmu.edu, srinivas.pandruvada@linux.intel.com,
 stable@vger.kernel.org, stern@rowland.harvard.edu, tglx@kernel.org,
 tiwei.btw@antgroup.com, tursulin@ursulin.net,
 usb-storage@lists.one-eyed-alien.net, virtualization@lists.linux.dev,
 vkoul@kernel.org, x86@kernel.org, xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH 01/11] params: bound array element output to the caller's
 page buffer
Date: Sun,  4 Oct 2026 16:17:41 +0530
Message-ID: <20261004104741.51238-1-anshumantewari123@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260521133326.2465264-1-kees@kernel.org>
References: <20260521133326.2465264-1-kees@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 23:53:28 +0000
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

On Thu, May 21, 2026 at 06:33:14AM -0700, Kees Cook wrote:
> ret = min(ret, (int)(PAGE_SIZE - 1 - off));
> if (!ret)
> 	break;

One question about the truncation behavior here: when an element does
not fully fit in the remaining buffer, this min() can cause only part
of that element to be copied. For example, if the remaining space is
4 bytes and the next element produces "123456789\n", the resulting
output could contain only "1234".

This leaves the reader with no way to distinguish a genuinely short
value from one that was truncated due to the PAGE_SIZE limit, while
the array otherwise still looks like a normal comma-separated list.

Is this partial-element truncation intentional for this patch, or is
the expectation that it gets handled as part of the later seq_buf
conversion? Would it be preferable to avoid copying an element unless
it fits completely, and leave the larger-buffer case to be addressed
later in the series?
